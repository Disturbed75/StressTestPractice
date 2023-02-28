# StressTestPractise

### Dependencies

* Make sure Docker is installed on your machine. If not - https://docs.docker.com/engine/install/
* Make sure siege is installed. If not - https://formulae.brew.sh/formula/siege
* Make sure dasel is installed (To gather results into csv). Installation - https://daseldocs.tomwright.me/installation

### Executing program

```
docker-compose
```
or
```
docker-compose up -d
```

Execute one of stress test scripts in scripts folder.
For example:
```
bash ./scripts/conc_10.sh
```
In order to gather results into csv file do
```
bash ./scripts/gather.sh
```

### Monitor results
* You may find generated results inside scripts/results folder
