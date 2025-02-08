.PHONY: all clean clone immutablue immutablue-cyan immutablue-nucleus kuberblue trueblue hyacinth-macaw blue-tuxonaut hawk-blueah dbox-fedora
CLONE := clone_immutablue clone_kuberblue clone_trueblue clone_hyacinth-macaw clone_blue-tuxonaut clone_hawk-blueah clone_dbox_fedora


clone_immutablue:
	git clone https://gitlab.com/immutablue/immutablue
	bash -c "cd ./immutablue && git submodule init && git submodule update"

clone_kuberblue: 
	git clone https://gitlab.com/immutablue/kuberblue

clone_trueblue: 
	git clone https://gitlab.com/immutablue/trueblue

clone_hyacinth-macaw:
	git clone https://gitlab.com/immutablue/hyacinth-macaw

clone_blue-tuxonaut:
	git clone https://gitlab.com/noahsibai/blue-tuxonaut

clone_hawk-blueah:
	git clone https://gitlab.com/immutablue/hawk-blueah

clone_dbox_fedora:
	git clone https://gitlab.com/immutablue/dbox-fedora


clone: $(CLONE)
clean:
	rm -rf ./immutablue{,-cyan,-nucleus} ./kuberblue ./trueblue ./hyacinth-macaw ./hawk-blueah ./blue-tuxonaut ./dbox-fedora

IMMUTABLUE := immutablue immutablue-lts immutablue-kinoite immutablue-kinoite-lts immutablue-vauxite immutablue-vauxite-lts immutablue-lazurite immutablue-lazurite-lts
IMMUTABLUE_CYAN := immutablue-cyan immutablue-nucleus-cyan immutablue-kinoite-cyan immutablue-vauxite-cyan immutablue-lazurite-cyan
IMMUTABLUE_NUCLEUS := immutablue-nucleus immutablue-nucleus-lts
IMMUTABLUE_KUBERBLUE := kuberblue kuberblue-lts kuberblue-nucleus kuberblue-nucleus-lts
IMMUTABLUE_TRUEBLUE := trueblue trueblue-lts trueblue-nucleus trueblue-nucleus-lts trueblue-kuberblue trueblue-kuberblue-lts trueblue-kuberblue-nucleus trueblue-kuberblue-nucleus-lts
HYACINTH_MACAW := hyacinth-macaw hyacinth-macaw-lts
BLUE_TUXONAUT := blue-tuxonaut blue-tuxonaut-lts
HAWK_BLUEAH := hawk-blueah hawk-blueah-lts
DBOX_CONTAINERS := dbox-fedora


# all: $(IMMUTABLUE) $(IMMUTABLUE_CYAN) $(IMMUTABLUE_NUCLEUS) $(IMMUTABLUE_KUBERBLUE) $(IMMUTABLUE_TRUEBLUE)
main: $(IMMUTABLUE) $(IMMUTABLUE_NUCLEUS) $(DBOX_CONTAINERS)
derivatives: $(IMMUTABLUE_KUBERBLUE) $(IMMUTABLUE_TRUEBLUE) 
nvidia: $(IMMUTABLUE_CYAN)
downstream: $(HYACINTH_MACAW) $(BLUE_TUXONAUT) $(HAWK_BLUEAH)
downstream-nvidia: hyacinth-macaw-cyan blue-tuxonaut-cyan hawk-blueah-cyan
all: main nvidia downstream downstream-nvidia


immutablue:
	cd ./immutablue && make ZFS=true all

immutablue-lts:
	cd ./immutablue && make LTS=1 all

immutablue-kinoite:
	cd ./immutablue && make ZFS=1 KINOITE=1 all

immutablue-kinoite-lts:
	cd ./immutablue && make LTS=1 KINOITE=1 all

immutablue-vauxite:
	cd ./immutablue && make ZFS=1 VAUXITE=1 all

immutablue-vauxite-lts:
	cd ./immutablue && make LTS=1 VAUXITE=1 all

immutablue-lazurite:
	cd ./immutablue && make ZFS=1 LAZURITE=1 all

immutablue-lazurite-lts:
	cd ./immutablue && make LTS=1 LAZURITE=1 all

immutablue-cyan:
	cd ./immutablue && make ZFS=1 CYAN=1 all 

immutablue-kinoite-cyan:
	cd ./immutablue && make ZFS=1 KINOITE=1 CYAN=1 all 

immutablue-vauxite-cyan:
	cd ./immutablue && make ZFS=1 VAUXITE=1 CYAN=1 all 

immutablue-lazurite-cyan:
	cd ./immutablue && make ZFS=1 LAZURITE=1 CYAN=1 all 

immutablue-nucleus:
	cd ./immutablue && make ZFS=1 NUCLEUS=1 all

immutablue-nucleus-lts:
	cd ./immutablue && make ZFS=1 NUCLEUS=1 LTS=1 all

immutablue-nucleus-cyan:
	cd ./immutablue && make ZFS=1 NUCLEUS=1 CYAN=1 all

kuberblue: $(IMMUTABLUE) $(NUCLEUS)
	cd ./kuberblue && make all

kuberblue-lts: $(IMMUTABLUE) $(NUCLEUS)
	cd ./kuberblue && make LTS=1 all

kuberblue-nucleus: $(IMMUTABLUE) $(NUCLEUS)
	cd ./kuberblue && make NUCLEUS=1 all

kuberblue-nucleus-lts: $(IMMUTABLUE) $(NUCLEUS)
	cd ./kuberblue && make NUCLEUS=1 LTS=1 all

trueblue: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
	cd ./trueblue && make all

trueblue-lts: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
	cd ./trueblue && make LTS=1 all

trueblue-nucleus: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
	cd ./trueblue && make NUCLEUS=1 all

trueblue-nucleus-lts: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
	cd ./trueblue && make NUCLEUS=1 LTS=1 all

trueblue-kuberblue: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
	cd ./trueblue && make KUBERBLUE=1 all

trueblue-kuberblue-lts: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
	cd ./trueblue && make KUBERBLUE=1 LTS=1 all

trueblue-kuberblue-nucleus: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
	cd ./trueblue && make KUBERBLUE_NUCLEUS=1 all

trueblue-kuberblue-nucleus-lts: $(IMMUTABLUE) $(NUCLEUS) $(KUBERBLUE) 
	cd ./trueblue && make KUBERBLUE_NUCLEUS=1 LTS=1 all




hyacinth-macaw: 
	cd ./hyacinth-macaw && make all

hyacinth-macaw-lts:
	cd ./hyacinth-macaw && make LTS=1 all

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

