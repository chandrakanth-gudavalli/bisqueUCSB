function [FileList] = spec_getFileList_ver1(FilePath,str)
cdir = dir(FilePath);   % get directory

% get files and sort 
cdir(1:2) = [];
for i = 1:size(cdir,1)
%    [pathstr, name, ext, versn] = fileparts(cdir(i).name);
    [pathstr, name, ext] = fileparts(cdir(i).name);
    if strcmp(ext,str)
        del(i) = 0;
        numname(i) = str2num(name);
    else
        del(i) = 1;
        numname(i) = 0;
    end
end
cdir(find(del)) = [];
numname(find(del)) = [];
[JUNK sidx] = sort(numname);
cdir = cdir(sidx);
for i = 1:size(cdir,1)
    FileList{i} = [FilePath cdir(i).name];
end

