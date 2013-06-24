# Baseline
## Dev box with batteries

### Instalation

```bash
git clone https://github.com/bltavares/baseline.git /opt/baseline
echo 'export PATH=$PATH:/opt/baseline/bin' >> $HOME/.bashrc
echo 'eval "$(baseline autocomplete)"' >> $HOME/.bashrc
```

### Commands

#### init - Create a new box in the project dir

```bash
baseline init <path to init box>
```

#### up - Bring a box up with some configuration

```bash
baseline up <environments>
```

e.g.:
```bash
baseline up ruby nodejs
```

#### ssh - Connect to the box
```bash
baseline ssh
```

#### provision - Provision a running box with the specified environments
```bash
baseline provision <environments>
```

#### down - Shutdown the box
```bash
baseline down
```

#### destroy - Destroy the box
```bash
baseline destroy
```
