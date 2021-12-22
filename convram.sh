cp header 2021
awk -F\| '{OFS = FS} $1 != "JobID" {if (substr($21,length($21)-1,1) == "M") {
  if (substr($21,length($21),1) == "c") {
    ram = substr($21,1,length($21)-2) * $14 / 1000;
  } else if (substr($21,length($21),1) == "n") {
    ram = substr($21,1,length($21)-2) / 1000;
  }
} else if (substr($21,length($21)-1,1) == "G") {
  if (substr($21,length($21),1) == "c") {
    ram = substr($21,1,length($21)-2) * $14;
  } else if (substr($21,length($21),1) == "n") {
    ram = substr($21,1,length($21)-2);
  }
}
$21 = ram
print $0}' SlurmStats* >> 2021
