%% EEG Predictive Modeling and Granger Causality Analysis

%% Data Loading and Initial Configuration

clear; clc; close all;

pmax = 20;
p = 7;

load('dataset.mat')

pfilter = 0.95;
fs = EEG.fs;
num_soggetti = size(EEG.series,1);

canali_nomi = EEG.channels';
canale_frontale_nome = 'F3';
canale_parietale_nome = 'P3';

canale_frontale_idx = find(strcmp(canali_nomi, canale_frontale_nome));
canale_parietale_idx = find(strcmp(canali_nomi, canale_parietale_nome));
