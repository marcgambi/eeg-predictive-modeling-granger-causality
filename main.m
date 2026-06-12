%% EEG Predictive Modeling and Granger Causality Analysis

%% Data Loading and Initial Configuration

clear; clc; close all;

pmax = 20;
p = 7;

load('databaseD.mat');

pfilter = 0.95;
fs = EEG.fs;
num_soggetti = size(EEG.series,1);

canali_nomi = EEG.channels';
canale_frontale_nome = 'F3';
canale_parietale_nome = 'P3';

canale_frontale_idx = find(strcmp(canali_nomi, canale_frontale_nome));
canale_parietale_idx = find(strcmp(canali_nomi, canale_parietale_nome));

%% Model Order Selection

order_selection(EEG, canale_frontale_idx, canale_parietale_idx, pfilter, pmax, p);

%% Statistical Analysis

[var_oa, var_oc, gc_front_par_oa, gc_front_par_oc, gc_par_front_oa, gc_par_front_oc] = ...
    statistical_analysis(EEG, canale_frontale_idx, canale_parietale_idx, pfilter, p);

%% Plots and Statistical Tests

plots(var_oa, var_oc, gc_front_par_oa, gc_front_par_oc, gc_par_front_oa, gc_par_front_oc);
