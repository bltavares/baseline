# Baseline
## Dev box with batteries

### Instalation

```bash
git clone https://github.com/bltavares/baseline.git /opt/baseline
export PATH=$PATH:/opt/baseline/bin
echo "eval \"$(baseline autocomplete)\"" >> $HOME/.bashrc
```

### Commands

#### init

```bash
baseline init <path to init box>
```

#### up

```bash
baseline up <environments>
```

e.g.:
```bash
baseline up ruby nodejs
```

#### ssh
```bash
baseline ssh
```

#### provision
```bash
baseline provision <environments>
```

#### down
```bash
baseline down
```

#### destroy
```bash
baseline destroy
```
