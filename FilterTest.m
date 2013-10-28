%ECSE 426 - MicroP
%Lab 3
%Choosing the depth of our 3-dimensional moving average filter


%We will play around with the filter depth.  If it's too small, the
%filtered signal will be noisy, but if it's too large, there will be major
%lag in the filtered output.

 %%Please format the .xls file in the following format
 %%Column A - x data, B - y data, C - z data
 %%then change the data length where necessary
 
 tempX = xlsread('tempData.xls', 'A1:A641'); %%change value depending on data sample
 tempY = xlsread('tempData.xls', 'B1:B641'); %%change value depending on data sample
 tempZ = xlsread('tempData.xls', 'C1:C641'); %%change value depending on data sample
  

filterDepthX = 10; %play with this figure
filterDepthY = 10;
filterDepthZ = 10;

filterX = zeros(filterDepthX, 1); %%change value depending on data sample
filterY = zeros(filterDepthY, 1); %%change value depending on data sample
filterZ = zeros(filterDepthZ, 1); %%change value depending on data sample

filterResultX = 1:641;
filterResultY = 1:641;
filterResultZ = 1:641;

for i = 1:(641) %%change value depending on data sample
    for j = filterDepthX:-1:2
        filterX(j) = filterX(j-1);
    end
    for j = filterDepthY:-1:2
        filterY(j) = filterY(j-1);
    end
    for j = filterDepthZ:-1:2
        filterZ(j) = filterZ(j-1);
    end
    filterX(1) = tempX(i);
    filterY(1) = tempY(i);
    filterZ(1) = tempZ(i);
    
    filterResultX(i) = mean(filterX);
    filterResultY(i) = mean(filterY);
    filterResultZ(i) = mean(filterZ);
 end

%plot unfiltered and filtered
%subplot(2,1,1)
%plot(temp)
%subplot(2,1,2)
plot(filterResult)

