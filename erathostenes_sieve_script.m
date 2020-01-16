% The Sieve of Eratosthenes
% This program was inspired by the artwork:
% Sieb des Eratosthenes (The Sieve of Eratosthenes) (1971) from  Rune Mields 
% (German painter, b. 1935)
% This recreation from her 9 panel artwork displays prime numbers as white
% dots. The left column displays numbers arranged in 89 columns, central
% column arrangement is 90 columns and right column 91.
% The lower panel displays the firs numbers starting from 1, where the
% linear patterns are evident. The middle row starts from 1e6 and the upper
% row starts from 1e15, where prime numbers are more scarce and the pattern
% looks almost random.
% ______________________________________________________________________________
% Copyright (C) 2020 Edgar Guevara, PhD
% ______________________________________________________________________________
clear; close all; clc
dpi = 300;
useSavedData = true;
printFig = false;
if useSavedData
    h = figure;                 set(h,'color', 'w')
    set(h, 'units', 'inches')   % Specify window units
    % Change figure and paper size
    set(h, 'Position', [0.1 0.1 9 13.5]); set(h, 'PaperPosition', [0.1 0.1 9 13.5])
    fileList = {...
        'primes_10_15_89.mat' 'primes_10_15_90.mat' 'primes_10_15_91.mat'...
        'primes_10_06_89.mat' 'primes_10_06_90.mat' 'primes_10_06_91.mat'...
        'primes_10_00_89.mat' 'primes_10_00_90.mat' 'primes_10_00_91.mat'};
    for idx = 1:9
        load(fileList{idx})
        subplot(3,3,idx);       imagesc(sieveA);
        colormap('gray');       axis image; set(gca, 'XTick', [], 'YTick', [])
    end
    if printFig
        % Save as PNG
        print(h, '-dpng', 'sieve.png', sprintf('-r%d',dpi));
    end
else
    nX = 90;                    % Number of columns
    nY = 135;                   % Number of Rows
    nOffset = 0;                % Offset (chenge to 1e6 or 1e15)
    A = nOffset + (1:nX*nY);    % Create the sequence of numbers
    A = reshape(A, [nX nY])';   % Force row-wise indexing
    tic
    sieveA = isprime(A);        % Perform the sieve of Eratosthenes
    toc
    % Plot
    h = figure;                 set(h,'Color', 'w')
    imagesc(sieveA);            colormap('gray')
    axis image;                 set(gca, 'XTick', [], 'YTick', [])
end

% EOF
