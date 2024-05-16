import argparse
import tomllib

parser = argparse.ArgumentParser(
    description="Download CRD schemas"
)

# Positional arguments
parser.add_argument("action")

# Flags
parser.add_argument("-c", "--config", default="k8scrd.toml")

# Parse args
args = parser.parse_args()

verbose = False

def validate_arguments(cliargs):
    cli_actions = ["refresh", "render"]
    if cliargs.action not in cli_actions:
        print("Invalid action:", cliargs.action, "unknown")
        print("Available actions:", ", ".join(cli_actions))
        return False

    return True

def generate_table(crds) -> list[str]:
    crd_base_url = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main"
    crds_table_rows = ["return {"]
    for apiGroup in crds:
        for apiVersion in crds[apiGroup]:
            for resource in crds[apiGroup][apiVersion]:
                name = resource
                url = f"{crd_base_url}/{apiGroup}/{resource.lower()}_{apiVersion}.json"
                crds_table_rows.append('  { name="'+name+' ('+apiVersion+')", uri="'+url+'" },')
    crds_table_rows.append("}")
    return crds_table_rows

def refresh(crds, output):
    table = generate_table(crds)
    with open(output, 'w') as outfile:
        outfile.write('\n'.join(row for row in table))

def render(crds):
    table = generate_table(crds)
    print('\n'.join(row for row in table))

def log(level, msg):
    if level.lower()=="debug" and not verbose:
        return
    print(f"{level.upper()}: {msg}")

if __name__ == "__main__":
    log("debug", "Validating arguments")
    if not validate_arguments(args):
        exit(1)
    log("debug", "Arguments validated")

    log("debug", f"Loading {args.config}")
    with open(args.config, "rb") as f:
        config = tomllib.load(f)
    log("info", "Config file loaded")

    crds = config["crds"]
    if args.action == "refresh":
        refresh(crds, config["config"]["output"])
        log("info", "CRDs mappings generated")
    elif args.action == "render":
        render(crds)
