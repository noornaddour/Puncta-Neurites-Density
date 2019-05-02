%When an interactive window pops up. this means that that neurite does not
%contain any puncta and you should just type in the path number, to create
%an excell sheet telling you which paths are empty. 
formatSpec = 'Path (%d)-0001-Z0_Area_&_Count.csv'
D = dir ;
[~,ndx] = natsortfiles({D.name}); % indices of correct order
D = D(ndx); % sort structure using indices


for k = 3:length(D)
     currD = D(k).name;
      fList = dir(currD)
      if length(fList) < 3
         
          prompt = {currD};
        %answer = inputdlg(prompt)
        EmptyPaths(k) = prompt(1)
        V(k)= 0
        
       

         
      end
      if length(fList) > 3 
      value = fList(3)
      value2 = fList(4)
      table = struct2table(value)
      table2 = struct2table(value2)
      locationPath = table(:,2)
      locationPuncta = table2(:,2)
      A = table2array(locationPath)
      B = table2array(locationPuncta)
      cd(A)
      
      

     
     str = sprintf(formatSpec, k-3)
     NeuritePath = csvread(str,1,2) 
     
     
      PunctaFile = csvread('RoiSet.csv',1)
      PunctaTotal = PunctaFile(:,1)
      V(k) = PunctaTotal(end)/NeuritePath
      cd('C:\Users\s4488590\Desktop\PART 2\Puncta Results\Image18')
      
      
      end
end
R = V.'
Empty = EmptyPaths.'
DensityFile = 'Density18.csv'
xlswrite(DensityFile,R)
ZerosPath = 'ZerosPath18.csv'
xlswrite(ZerosPath,Empty)
clear all
