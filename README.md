# docker-Bio-STR-exSTRa
Docker build for the Perl module [Bio::STR::exSTRa](https://github.com/bahlolab/Bio-STR-exSTRa).

Allows the use of Docker to run the exSTRa_score.pl Perl script without having to worry about dependencies.

Retrieving the repository:
```
docker pull ricktankard/bio-str-exstra:latest
```

The Docker container provides 'exSTRa_score.pl' as an executable.

For example, if using the example script:
https://github.com/bahlolab/Bio-STR-exSTRa/blob/master/examples/run_strexpansion_score.sh

In the final command:
```
# Please set the correct path for the exSTRa_score.pl script
perl "$exstra_score" \
    "$reference" \
    "$repeat_database" \
    $bam_glob \
    > "$output"
```

replace `perl "$exstra_score"` with:
```
docker run <mount command> ricktankard/bio-str-exstra:latest exSTRa_score.pl
```

You will need to appropriately set up mounts for your data, replacing `<mount command>` as for Docker in general. 

An example of a full command with all input files in a directory named 'inputs', that writes to a file output/exSTRa_scores.txt is:

```
docker run --mount type=bind,source="$(pwd)"/input,target=/input \
    ricktankard/bio-str-exstra:latest \
    exSTRa_score.pl \
    /input/path/to/hg19.fa \
    /input/path/to/repeat_expansion_disorders.txt \
    /input/path/to/bams/*.bam \
    > output/exSTRa_scores.txt
```

# Dockerfile

The Dockerfile for this container can be found in https://github.com/trickytank/docker-Bio-STR-exSTRa.
