# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -W https://travis.garbas.si/wheels_cache/ -v -V 3.5 -O ../overrides.nix -r requirements.txt
#

{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python35;
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            if [ -e $out/${pkgs.python35.sitePackages}/pip/req/req_install.py ]; then
              sed -i \
                -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"  \
                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"  \
                $out/${pkgs.python35.sitePackages}/pip/req/req_install.py
            fi
          '';
        });
      };
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python35-interpreter";
        buildInputs = [ makeWrapper ] ++ (selectPkgsFn pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (selectPkgsFn pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -x "$prog" ] && [ -f "$prog" ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          ln -s ${pythonPackages.python.executable} \
              python3
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };

      interpreter = interpreterWithPackages builtins.attrValues;
    in {
      __old = pythonPackages;
      inherit interpreter;
      inherit interpreterWithPackages;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (
          drv.drvAttrs // f drv.drvAttrs // { meta = drv.meta; }
        );
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {
    "Mako" = python.mkDerivation {
      name = "Mako-1.0.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz"; sha256 = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.makotemplates.org/";
        license = licenses.mit;
        description = "A super-fast templating language that borrows the  best ideas from the existing templating languages.";
      };
    };

    "MarkupSafe" = python.mkDerivation {
      name = "MarkupSafe-1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"; sha256 = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/markupsafe";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };

    "apipkg" = python.mkDerivation {
      name = "apipkg-1.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a8/af/07a13b1560ebcc9bf4dd439aeb63243cbd8d374f4f328691470d6a9b9804/apipkg-1.5.tar.gz"; sha256 = "37228cda29411948b422fae072f57e31d3396d2ee1c9783775980ee9c9990af6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/apipkg";
        license = licenses.mit;
        description = "apipkg: namespace control and lazy-import mechanism";
      };
    };

    "atomicwrites" = python.mkDerivation {
      name = "atomicwrites-1.1.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a1/e1/2d9bc76838e6e6667fde5814aa25d7feb93d6fa471bf6816daac2596e8b2/atomicwrites-1.1.5.tar.gz"; sha256 = "240831ea22da9ab882b551b31d4225591e5e447a68c5e188db5b89ca1d487585"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/untitaker/python-atomicwrites";
        license = licenses.mit;
        description = "Atomic file writes.";
      };
    };

    "attrs" = python.mkDerivation {
      name = "attrs-18.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e4/ac/a04671e118b57bee87dabca1e0f2d3bda816b7a551036012d0ca24190e71/attrs-18.1.0.tar.gz"; sha256 = "e0d0eb91441a3b53dab4d9b743eafc1ac44476296a2053b6ca3af0b139faf87b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."coverage"
      self."pytest"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.attrs.org/";
        license = licenses.mit;
        description = "Classes Without Boilerplate";
      };
    };

    "coverage" = python.mkDerivation {
      name = "coverage-4.5.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/35/fe/e7df7289d717426093c68d156e0fd9117c8f4872b6588e8a8928a0f68424/coverage-4.5.1.tar.gz"; sha256 = "56e448f051a201c5ebbaa86a5efd0ca90d327204d8b059ab25ad0f35fbfd79f1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/ned/coveragepy";
        license = licenses.asl20;
        description = "Code coverage measurement for Python";
      };
    };

    "decorator" = python.mkDerivation {
      name = "decorator-4.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6f/24/15a229626c775aae5806312f6bf1e2a73785be3402c0acdec5dbddd8c11e/decorator-4.3.0.tar.gz"; sha256 = "c39efa13fbdeb4506c476c9b3babf6a718da943dab7811c206005a4a956c080c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/micheles/decorator";
        license = licenses.bsdOriginal;
        description = "Better living through Python with decorators";
      };
    };

    "execnet" = python.mkDerivation {
      name = "execnet-1.5.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ab/c0/9496c35092eac2523ee8993ca3690b2d0aa95ef56623035b9c890745ac55/execnet-1.5.0.tar.gz"; sha256 = "a7a84d5fa07a089186a329528f127c9d73b9de57f1a1131b82bb5320ee651f6a"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."apipkg"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://codespeak.net/execnet";
        license = licenses.mit;
        description = "execnet: rapid multi-Python deployment";
      };
    };

    "glob2" = python.mkDerivation {
      name = "glob2-0.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f0/e8/970c7a031b2d7f9a21fefaa8c9d5c38001f8f25055f4ffcb32b3dbecd1ea/glob2-0.6.tar.gz"; sha256 = "f5b0a686ff21f820c4d3f0c4edd216704cea59d79d00fa337e244a2f2ff83ed6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/miracle2k/python-glob2/";
        license = licenses.bsdOriginal;
        description = "Version of the glob module that can capture patterns and supports recursive wildcards";
      };
    };

    "greenlet" = python.mkDerivation {
      name = "greenlet-0.4.13";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/13/de/ba92335e9e76040ca7274224942282a80d54f85e342a5e33c5277c7f87eb/greenlet-0.4.13.tar.gz"; sha256 = "0fef83d43bf87a5196c91e73cb9772f945a4caaff91242766c5916d1dd1381e4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python-greenlet/greenlet";
        license = licenses.mit;
        description = "Lightweight in-process concurrent programming";
      };
    };

    "more-itertools" = python.mkDerivation {
      name = "more-itertools-4.2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c0/2f/6773347277d76c5ade4414a6c3f785ef27e7f5c4b0870ec7e888e66a8d83/more-itertools-4.2.0.tar.gz"; sha256 = "2b6b9893337bfd9166bee6a62c2b0c9fe7735dcf85948b387ec8cba30e85d8e8"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/erikrose/more-itertools";
        license = licenses.mit;
        description = "More routines for operating on iterables, beyond itertools";
      };
    };

    "oejskit" = python.mkDerivation {
      name = "oejskit-0.9.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/16/10/f9d24c1f5ff7a8236e48d3c8fbd12e76eb4741e6f4e76e5c25c51d7ed7a9/oejskit-0.9.0.tar.gz"; sha256 = "06d645e2506acd85b8a858b550907c5c8440d4f1315fc2c4e6b86b091c29846e"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/pedronis/js-infrastructure/";
        license = licenses.mit;
        description = "Open End JavaScript testing and utility kit";
      };
    };

    "parse" = python.mkDerivation {
      name = "parse-1.8.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/79/e1/522401e2cb06d09497f2f56baa3b902116c97dec6f448d02b730e63b44a8/parse-1.8.4.tar.gz"; sha256 = "c3cdf6206f22aeebfa00e5b954fcfea13d1b2dc271c75806b6025b94fb490939"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/r1chardj0n3s/parse";
        license = licenses.bsdOriginal;
        description = "parse() is the opposite of format()";
      };
    };

    "parse-type" = python.mkDerivation {
      name = "parse-type-0.4.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2b/e5/312ce9f1bd209afcf4fc68235c8776a36270d24ad05bdfd2aaaf06647ea9/parse_type-0.4.2.tar.gz"; sha256 = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."coverage"
      self."parse"
      self."pytest"
      self."pytest-cov"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jenisys/parse_type";
        license = licenses.bsdOriginal;
        description = "Simplifies to build parse types based on the parse module";
      };
    };

    "pep8" = python.mkDerivation {
      name = "pep8-1.7.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/01/a0/64ba19519db49e4094d82599412a9660dee8c26a7addbbb1bf17927ceefe/pep8-1.7.1.tar.gz"; sha256 = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pep8.readthedocs.org/";
        license = licenses.mit;
        description = "Python style guide checker";
      };
    };

    "pluggy" = python.mkDerivation {
      name = "pluggy-0.6.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/11/bf/cbeb8cdfaffa9f2ea154a30ae31a9d04a1209312e2919138b4171a1f8199/pluggy-0.6.0.tar.gz"; sha256 = "7f8ae7f5bdf75671a718d2daf0a64b7885f74510bcd98b1a0bb420eb9a9d0cff"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pluggy";
        license = licenses.mit;
        description = "plugin and hook calling mechanisms for python";
      };
    };

    "py" = python.mkDerivation {
      name = "py-1.5.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/35/77/a0a2a4126cf454e6ac772942898379e2fe78f2b7885df0461a5b8f8a8040/py-1.5.4.tar.gz"; sha256 = "3fd59af7435864e1a243790d322d763925431213b6b8529c6ca71081ace3bbf7"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://py.readthedocs.io/";
        license = licenses.mit;
        description = "library with cross-python path, ini-parsing, io, code, log facilities";
      };
    };

    "pyflakes" = python.mkDerivation {
      name = "pyflakes-2.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/92/9e/386c0d9deef14996eb90d9deebbcb9d3ceb70296840b09615cb61b2ae231/pyflakes-2.0.0.tar.gz"; sha256 = "9a7662ec724d0120012f6e29d6248ae3727d821bba522a0e6b356eff19126a49"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/PyCQA/pyflakes";
        license = licenses.mit;
        description = "passive checker of Python programs";
      };
    };

    "pytest" = python.mkDerivation {
      name = "pytest-3.6.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/55/50/399419c03c39bf41faa7cbd5a8976c076037b2d76adf2535610919806d67/pytest-3.6.3.tar.gz"; sha256 = "0453c8676c2bee6feb0434748b068d5510273a916295fd61d306c4f22fbfd752"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."atomicwrites"
      self."attrs"
      self."more-itertools"
      self."pluggy"
      self."py"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pytest.org";
        license = licenses.mit;
        description = "pytest: simple powerful testing with Python";
      };
    };

    "pytest-bdd" = python.mkDerivation {
      name = "pytest-bdd-2.21.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/10/38/8a72f701123ab474431366ee027f6c1517741ef09299b44720b49dc40e51/pytest-bdd-2.21.0.tar.gz"; sha256 = "1420bafbba5a3fe3182b553beb28bc5ab68f0e438fa4369b4f0f590a7f18177f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Mako"
      self."glob2"
      self."parse"
      self."parse-type"
      self."pytest"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-bdd";
        license = licenses.mit;
        description = "BDD for pytest";
      };
    };

    "pytest-cache" = python.mkDerivation {
      name = "pytest-cache-1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d1/15/082fd0428aab33d2bafa014f3beb241830427ba803a8912a5aaeaf3a5663/pytest-cache-1.0.tar.gz"; sha256 = "be7468edd4d3d83f1e844959fd6e3fd28e77a481440a7118d430130ea31b07a9"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."execnet"
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/hpk42/pytest-cache/";
        license = licenses.gpl1;
        description = "pytest plugin with mechanisms for caching across test runs";
      };
    };

    "pytest-catchlog" = python.mkDerivation {
      name = "pytest-catchlog-1.2.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f2/2b/2faccdb1a978fab9dd0bf31cca9f6847fbe9184a0bdcc3011ac41dd44191/pytest-catchlog-1.2.2.zip"; sha256 = "4be15dc5ac1750f83960897f591453040dff044b5966fe24a91c2f7d04ecfcf0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."py"
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/eisensheng/pytest-catchlog";
        license = licenses.mit;
        description = "py.test plugin to catch log messages. This is a fork of pytest-capturelog.";
      };
    };

    "pytest-cov" = python.mkDerivation {
      name = "pytest-cov-2.5.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/24/b4/7290d65b2f3633db51393bdf8ae66309b37620bc3ec116c5e357e3e37238/pytest-cov-2.5.1.tar.gz"; sha256 = "03aa752cf11db41d281ea1d807d954c4eda35cfa1b21d6971966cc041bbf6e2d"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."coverage"
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-cov";
        license = licenses.bsdOriginal;
        description = "Pytest plugin for measuring coverage.";
      };
    };

    "pytest-django" = python.mkDerivation {
      name = "pytest-django-3.3.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/be/1a/f26eb7192680671a100a558225b7212548473e0b3a7dd393222e93dace46/pytest-django-3.3.2.tar.gz"; sha256 = "3fea4d0a84bf3af1f1e82448b9a91b3ddb22b659d802e026ae843040da0c3220"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pytest-django.readthedocs.io/";
        license = licenses.bsdOriginal;
        description = "A Django plugin for pytest.";
      };
    };

    "pytest-flakes" = python.mkDerivation {
      name = "pytest-flakes-3.0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7c/d0/78bb26124f6de980206e941205cc11011a8bd4606c7294a259549af827e2/pytest-flakes-3.0.2.tar.gz"; sha256 = "763ec290b89e2dc8f25f49d71cb9b869b8df843697b730233f61c78f847f2e57"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyflakes"
      self."pytest"
      self."pytest-cache"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/fschulze/pytest-flakes";
        license = licenses.mit;
        description = "pytest plugin to check source code with pyflakes";
      };
    };

    "pytest-forked" = python.mkDerivation {
      name = "pytest-forked-0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b3/b2/1ec910b0f798cc86f2531631d7a2da030b16c165e07545537332fd4eb505/pytest-forked-0.2.tar.gz"; sha256 = "e4500cd0509ec4a26535f7d4112a8cc0f17d3a41c29ffd4eab479d2a55b30805"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-forked";
        license = licenses.mit;
        description = "run tests in isolated forked subprocesses";
      };
    };

    "pytest-instafail" = python.mkDerivation {
      name = "pytest-instafail-0.4.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7a/c9/5fc6d9a064d527c0dd1f127fbb117b395ec256f42160e9ae0a75aed94594/pytest-instafail-0.4.0.tar.gz"; sha256 = "162bd7c5c196e3b2fe2a5285b69362ee3d9f768d5451413ef914be38df74e3de"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-instafail";
        license = licenses.bsdOriginal;
        description = "py.test plugin to show failures instantly";
      };
    };

    "pytest-pep8" = python.mkDerivation {
      name = "pytest-pep8-1.0.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/1f/1c/c834344ef39381558b047bea1e3005197fa8457c199d58219996ca07defb/pytest-pep8-1.0.6.tar.gz"; sha256 = "032ef7e5fa3ac30f4458c73e05bb67b0f036a8a5cb418a534b3170f89f120318"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pep8"
      self."pytest"
      self."pytest-cache"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/hpk42/pytest-pep8/";
        license = "MIT license";
        description = "pytest plugin to check PEP8 requirements";
      };
    };

    "pytest-timeout" = python.mkDerivation {
      name = "pytest-timeout-1.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e9/de/ce1ed3e2c787080a66ef40e75ae13b13311a44374b652e9b1a014d4251ba/pytest-timeout-1.3.0.tar.gz"; sha256 = "08b550b498b9251901a3747f02aa2624ed53a9c8285ca482551346c85b47d641"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/pytest-dev/pytest-timeout/";
        license = licenses.mit;
        description = "py.test plugin to abort hanging tests";
      };
    };

    "pytest-twisted" = python.mkDerivation {
      name = "pytest-twisted-1.8";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/fd/1e/d5ae0034e20750b6e7f9270af70bfa83e95707c538939511d460f0e4c5fc/pytest-twisted-1.8.zip"; sha256 = "6c3a0db55e0af2320b43b7ac9fe3045147b8148f6f1bfe1ce1b48f72e7d4ee13"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."decorator"
      self."greenlet"
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-twisted";
        license = licenses.bsdOriginal;
        description = "A twisted plugin for py.test.";
      };
    };

    "pytest-xdist" = python.mkDerivation {
      name = "pytest-xdist-1.22.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/5d/be/f3c5a5edf6161d17d90fe458281249bebb7aba1af076621a19b007d632fa/pytest-xdist-1.22.2.tar.gz"; sha256 = "e8f5744acc270b3e7d915bdb4d5f471670f049b6fbd163d4cbd52203b075d30f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."execnet"
      self."pytest"
      self."pytest-forked"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-xdist";
        license = licenses.mit;
        description = "py.test xdist plugin for distributed testing and loop-on-failing modes";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.11.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"; sha256 = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/six/";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  overrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (import ../overrides.nix { inherit pkgs python ; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [overrides] else [] ) ++ commonOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )