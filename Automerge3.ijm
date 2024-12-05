macro "batch_merge_channels"{
    setBatchMode(true);
    file1 = getDirectory("C=0");
    list1 = getFileList(file1);
    Array.sort(list1)
    n1 = lengthOf(list1);
    
    file2 = getDirectory("C=2");
    list2 = getFileList(file2); 
    Array.sort(list2)
    
    file3 = getDirectory("C=3");
    list3 = getFileList(file3); 
    Array.sort(list3)
    
    file4 = getDirectory("Merge");
    list4 = getFileList(file4);
    n2 = lengthOf(list4);
    
    small = n1;

    for(i = n2; i < small; i++) {
      name = list3[i];
      open(file1 + list1[i]);
      open(file2 + list2[i]);
      open(file3 + list3[i]);
      run("Merge Channels...", "c1=[" + list2[i] + "] c5=[" + list1[i] + "] c6=[" + list3[i] + "] keep ignore");
      saveAs("tiff", file4 + name+"Merge");
    }
}
