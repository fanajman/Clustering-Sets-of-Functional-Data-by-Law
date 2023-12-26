load('simresul_DKW_Auto.mat')
load('simresul_DKW_Brown.mat')

comp = 7;

rplotAuto10 = [];
for ii = 1:comp
    rplotAuto10 = [rplotAuto10 mean(squeeze(resultsAutoDKW1(ii,1,1:100))')];
end

rplotAuto30 = [];
for ii = 1:comp
    rplotAuto30 = [rplotAuto30 mean(squeeze(resultsAutoDKW1(ii,2,1:100))')];
end


rplotAuto50 = [];
for ii = 1:comp
    rplotAuto50 = [rplotAuto50 mean(squeeze(resultsAutoDKW1(ii,3,1:100))')];
end
close all
figure
plot(40:20:(40+20*(comp-1)),rplotAuto10, 'blue');hold
plot(40:20:(40+20*(comp-1)),rplotAuto30, 'red')
plot(40:20:(40+20*(comp-1)),rplotAuto50, 'color', [0 0.5 0])
ylim([0 1])


rplotBrown10 = [];
for ii = 1:comp
    rplotBrown10 = [rplotBrown10 mean(squeeze(resultsBrownDKW1(ii,1,1:100))')];
end

rplotBrown30 = [];
for ii = 1:comp
    rplotBrown30 = [rplotBrown30 mean(squeeze(resultsBrownDKW1(ii,2,1:100))')];
end


rplotBrown50 = [];
for ii = 1:comp
    rplotBrown50 = [rplotBrown50 mean(squeeze(resultsBrownDKW1(ii,3,1:100))')];
end

figure
plot(40:20:(40+20*(comp-1)),rplotBrown10, 'blue');hold
plot(40:20:(40+20*(comp-1)),rplotBrown30, 'red')
plot(40:20:(40+20*(comp-1)),rplotBrown50, 'color', [0 0.5 0])
ylim([0 1])


e0AutoDKW = [];
for ii = 1:comp
    e0AutoDKW = [e0AutoDKW mean(squeeze(resultsAutoDKW2(ii,1,1:100))')];
end

e0BrownDKW = [];
for ii = 1:comp
    e0BrownDKW = [e0BrownDKW mean(squeeze(resultsBrownDKW2(ii,1,1:100))')];
end

figure;
plot(40:20:(40+20*(comp-1)),e0BrownDKW);hold
plot(40:20:(40+20*(comp-1)),e0AutoDKW)
ylim([0 1])

e0AutoDKW = [];
for ii = 1:comp
    e0AutoDKW = [e0AutoDKW mean(squeeze(1-resultsAutoDKW2(ii,1,1:100))')];
end

e0BrownDKW = [];
for ii = 1:comp
    e0BrownDKW = [e0BrownDKW mean(squeeze(1-resultsBrownDKW2(ii,1,1:100))')];
end

figure;
plot(40:20:(40+20*(comp-1)),e0BrownDKW);hold
plot(40:20:(40+20*(comp-1)),e0AutoDKW)
ylim([0 0.15])

e1AutoDKW = [];
for ii = 1:comp
    e1AutoDKW = [e1AutoDKW mean(squeeze(1-resultsAutoDKW3(ii,1,1:100))')];
end

e1BrownDKW = [];
for ii = 1:comp
    e1BrownDKW = [e1BrownDKW mean(squeeze(1-resultsBrownDKW3(ii,1,1:100))')];
end

figure;
plot(40:20:(40+20*(comp-1)),e1BrownDKW);hold
plot(40:20:(40+20*(comp-1)),e1AutoDKW)
ylim([0 0.15])

