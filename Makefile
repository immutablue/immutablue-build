.PHONY: all clean clone immutablue immutablue-cyan immutablue-nucleus kuberblue trueblue hyacinth-macaw blue-tuxonaut hawk-blueah dbox-fedora
CLONE := clone_immutablue clone_hyacinth-macaw clone_blue-tuxonaut clone_hawk-blueah clone_dbox_fedora


clone_immutablue:
	git clone --recurse-submodules https://gitlab.com/immutablue/immutablue

# clone_kuberblue: 
# 	git clone https://gitlab.com/immutablue/kuberblue
#
# clone_trueblue: 
# 	git clone https://gitlab.com/immutablue/trueblue

clone_hyacinth-macaw:
	git clone --recurse-submodules https://gitlab.com/immutablue/hyacinth-macaw

clone_blue-tuxonaut:
	git clone https://gitlab.com/noahsibai/blue-tuxonaut

clone_hawk-blueah:
	git clone https://gitlab.com/immutablue/hawk-blueah

clone_dbox_fedora:
	git clone https://gitlab.com/immutablue/dbox-fedora


clone: $(CLONE)
clean:
	rm -rf ./immutablue{,-cyan,-nucleus} ./kuberblue ./trueblue ./hyacinth-macaw ./hawk-blueah ./blue-tuxonaut ./dbox-fedora

IMMUTABLUE_DEPS := immutablue-deps
IMMUTABLUE := immutablue immutablue-kinoite immutablue-vauxite immutablue-lazurite immutablue-nix
IMMUTABLUE_LTS := immutablue-lts immutablue-lts-nix immutablue-kinoite-lts immutablue-vauxite-lts immutablue-lazurite-lts
IMMUTABLUE_CYAN := immutablue-cyan immutablue-nucleus-cyan immutablue-kinoite-cyan immutablue-vauxite-cyan immutablue-lazurite-cyan
IMMUTABLUE_NUCLEUS := immutablue-nucleus immutablue-nucleus-nix
IMMUTABLUE_NUCLEUS_LTS := immutablue-nucleus-lts immutablue-nucleus-lts-nix
IMMUTABLUE_KUBERBLUE := kuberblue kuberblue-lts kuberblue-nucleus kuberblue-nucleus-lts kuberblue-nix kuberblue-lts-nix kuberblue-nucleus-nix kuberblue-nucleus-lts-nix
IMMUTABLUE_TRUEBLUE := trueblue trueblue-nucleus trueblue-kuberblue  trueblue-kuberblue-nucleus trueblue-nix trueblue-nucleus-nix trueblue-kuberblue-nix trueblue-kuberblue-nucleus-nix
HYACINTH_MACAW := hyacinth-macaw hyacinth-macaw-lts hyacinth-macaw-nix hyacinth-macaw-lts-nix
BLUE_TUXONAUT := blue-tuxonaut blue-tuxonaut-lts
HAWK_BLUEAH := hawk-blueah hawk-blueah-lts
DBOX_CONTAINERS := dbox-fedora


# all: $(IMMUTABLUE) $(IMMUTABLUE_CYAN) $(IMMUTABLUE_NUCLEUS) $(IMMUTABLUE_KUBERBLUE) $(IMMUTABLUE_TRUEBLUE)
deps: $(IMMUTABLUE_DEPS)
main: $(IMMUTABLUE) $(IMMUTABLUE_NUCLEUS) $(DBOX_CONTAINERS)
main_lts: $(IMMUTABLUE_LTS) $(IMMUTABLUE_NUCLEUS_LTS)
derivatives: $(IMMUTABLUE_KUBERBLUE) $(IMMUTABLUE_TRUEBLUE) 
nvidia: $(IMMUTABLUE_CYAN)
downstream: $(HYACINTH_MACAW) #$(BLUE_TUXONAUT) #$(HAWK_BLUEAH)
downstream-nvidia: hyacinth-macaw-cyan blue-tuxonaut-cyan hawk-blueah-cyan
all: main nvidia downstream downstream-nvidia


immutablue-deps:
	cd ./immutablue && make build-deps push-deps

immutablue:
	cd ./immutablue && make all

immutablue-lts:
	cd ./immutablue && make LTS=1 all

immutablue-nix:
	cd ./immutablue && make NIX=1 all

immutablue-lts-nix:
	cd ./immutablue && make LTS=1 NIX=1 all

immutablue-kinoite:
	cd ./immutablue && make KINOITE=1 all

immutablue-kinoite-lts:
	cd ./immutablue && make LTS=1 KINOITE=1 all

immutablue-vauxite:
	cd ./immutablue && make VAUXITE=1 all

immutablue-vauxite-lts:
	cd ./immutablue && make LTS=1 VAUXITE=1 all

immutablue-lazurite:
	cd ./immutablue && make LAZURITE=1 all

immutablue-lazurite-lts:
	cd ./immutablue && make LTS=1 LAZURITE=1 all

immutablue-cyan:
	cd ./immutablue && make CYAN=1 all 

immutablue-kinoite-cyan:
	cd ./immutablue && make KINOITE=1 CYAN=1 all 

immutablue-vauxite-cyan:
	cd ./immutablue && make VAUXITE=1 CYAN=1 all 

immutablue-lazurite-cyan:
	cd ./immutablue && make LAZURITE=1 CYAN=1 all 

immutablue-nucleus:
	cd ./immutablue && make NUCLEUS=1 all

immutablue-nucleus-nix:
	cd ./immutablue && make NUCLEUS=1 NIX=1 all

immutablue-nucleus-lts:
	cd ./immutablue && make NUCLEUS=1 LTS=1 all

immutablue-nucleus-lts-nix:
	cd ./immutablue && make NUCLEUS=1 LTS=1 NIX=1 all

immutablue-nucleus-cyan:
	cd ./immutablue && make NUCLEUS=1 CYAN=1 all

kuberblue:
	cd ./immutablue && make KUBERBLUE=1 all

kuberblue-lts:
	cd ./immutablue && make KUBERBLUE=1 LTS=1 all

kuberblue-nucleus: 
	cd ./immutablue && make KUBERBLUE=1 NUCLEUS=1 all

kuberblue-nucleus-lts: 
	cd ./immutablue && make KUBERBLUE=1 NUCLEUS=1 LTS=1 all

kuberblue-nix:
	cd ./immutablue && make KUBERBLUE=1 NIX=1 all

kuberblue-lts-nix:
	cd ./immutablue && make KUBERBLUE=1 LTS=1 NIX=1 all

kuberblue-nucleus-nix: 
	cd ./immutablue && make KUBERBLUE=1 NUCLEUS=1 NIX=1 all

kuberblue-nucleus-lts-nix: 
	cd ./immutablue && make KUBERBLUE=1 NUCLEUS=1 LTS=1 NIX=1 all


trueblue: 
	cd ./immutablue && make TRUEBLUE=1 all

# trueblue is already lts we just don't tag it as such
# trueblue-lts: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
# 	cd ./immutablue && make LTS=1 all

trueblue-nucleus:
	cd ./immutablue && make TRUEBLUE=1 NUCLEUS=1 all

# trueblue is already lts we just don't tag it as such
# trueblue-nucleus-lts: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
# 	cd ./immutablue && make NUCLEUS=1 LTS=1 all

trueblue-kuberblue:
	cd ./immutablue && make KUBERBLUE=1 TRUEBLUE=1 all

# trueblue is already lts we just don't tag it as such
# trueblue-kuberblue-lts: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
# 	cd ./immutablue && make KUBERBLUE=1 LTS=1 all

trueblue-kuberblue-nucleus:
	cd ./immutablue && make KUBERBLUE=1 TRUEBLUE=1 NUCLEUS=1 all

# trueblue is already lts we just don't tag it as such
# trueblue-kuberblue-nucleus-lts: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
# 	cd ./immutablue && make KUBERBLUE_NUCLEUS=1 LTS=1 all

trueblue-nix: 
	cd ./immutablue && make TRUEBLUE=1 NIX=1 all

trueblue-nucleus-nix:
	cd ./immutablue && make TRUEBLUE=1 NUCLEUS=1 NIX=1 all

trueblue-kuberblue-nix:
	cd ./immutablue && make KUBERBLUE=1 TRUEBLUE=1 NIX=1 all

trueblue-kuberblue-nucleus-nix: 
	cd ./immutablue && make KUBERBLUE=1 TRUEBLUE=1 NUCLEUS=1 NIX=1 all




hyacinth-macaw: 
	cd ./hyacinth-macaw && make all

hyacinth-macaw-lts:
	cd ./hyacinth-macaw && make LTS=1 all

hyacinth-macaw-nix: 
	cd ./hyacinth-macaw && make NIX=1 all

hyacinth-macaw-lts-nix:
	cd ./hyacinth-macaw && make LTS=1 NIX=1 all

hyacinth-macaw-cyan:
	cd ./hyacinth-macaw && make NVIDIA=1 all

blue-tuxonaut:
	cd ./blue-tuxonaut && make all

blue-tuxonaut-lts:
	cd ./blue-tuxonaut && make LTS=1 all

blue-tuxonaut-cyan:
	cd ./blue-tuxonaut && make NVIDIA=1 all

hawk-blueah:
	cd ./hawk-blueah && make all

hawk-blueah-lts:
	cd ./hawk-blueah && make LTS=1 all

hawk-blueah-cyan:
	cd ./hawk-blueah && make NVIDIA=1 all




dbox-fedora:
	cd ./dbox-fedora && make all

