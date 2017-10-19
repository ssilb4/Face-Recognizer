function [path_name, name] = load_test_image()
[filename, path]=uigetfile('*.*');
path_name = [path,'\',filename];
name = filename;