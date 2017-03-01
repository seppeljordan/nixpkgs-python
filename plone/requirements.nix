# generated using pypi2nix tool (version: 1.8.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -v -V 2.7 -b buildout.cfg -E pkgconfig zlib libjpeg openjpeg libtiff freetype lcms2 libwebp tcl libxml2 libxslt
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
    python = pkgs.python27Full;
  };

  commonBuildInputs = with pkgs; [ pkgconfig zlib libjpeg openjpeg libtiff freetype lcms2 libwebp tcl libxml2 libxslt ];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreter = pythonPackages.buildPythonPackage {
        name = "python27Full-interpreter";
        buildInputs = [ makeWrapper ] ++ (builtins.attrValues pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter}               $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "               (builtins.attrValues pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -f $prog ]; then
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
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };
    in {
      __old = pythonPackages;
      inherit interpreter;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs);
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {

    "AccessControl" = python.mkDerivation {
      name = "AccessControl-3.0.12";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bc/d4/da973acb9fdee0f55d53b871ebf6eb0b02fd8b1f02b6293a8d8caa68463d/AccessControl-3.0.12.tar.gz"; sha256 = "57984b6c550a7784c93af8d4612ec4476d0b623abc0099f09db42703b203fa95"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."ExtensionClass"
      self."Persistence"
      self."Record"
      self."RestrictedPython"
      self."ZODB3"
      self."transaction"
      self."zExceptions"
      self."zope.component"
      self."zope.configuration"
      self."zope.deferredimport"
      self."zope.interface"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Security framework for Zope2.";
      };
    };



    "Acquisition" = python.mkDerivation {
      name = "Acquisition-4.2.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9e/32/00f343af778abd9f260fe3b8b183fc5033eb554c65d5c7c601dfcd848536/Acquisition-4.2.2.tar.gz"; sha256 = "90bbeedfff34630d63adf97be5c156ad28920412b319eb95db7d6d39de7bd623"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ExtensionClass"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Acquisition is a mechanism that allows objects to obtain attributes from the containment hierarchy they're in.";
      };
    };



    "Chameleon" = python.mkDerivation {
      name = "Chameleon-2.24";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5a/9e/637379ffa13c5172b5c0e704833ffea6bf51cec7567f93fd6e903d53ed74/Chameleon-2.24.tar.gz"; sha256 = "452e9580040ed8541062b16e21eaef4231dd5ed8da3ad9548246b9eef5c9787a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "BSD-like (http://repoze.org/license.html)";
        description = "Fast HTML/XML Template Compiler.";
      };
    };



    "DateTime" = python.mkDerivation {
      name = "DateTime-4.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/66/3c/cf4272421dc2c2094563093dcc57930b589f54c84f2fa5eaf27442cc4c35/DateTime-4.0.1.zip"; sha256 = "a4073f0549862278aad3986982e835092009fca681f9d4a719112eb24964695b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytz"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "";
        description = "This package provides a DateTime data type, as known from Zope 2.";
      };
    };



    "DocumentTemplate" = python.mkDerivation {
      name = "DocumentTemplate-2.13.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ef/32/8aee06779be806279ac7b83e3f58b0c03e93ea7dcd24850bbd5cb9d5562f/DocumentTemplate-2.13.2.zip"; sha256 = "4bebe644992fe0b0966da2c4fb600745ed8ff3398665b296371aa46f668180af"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Acquisition"
      self."ExtensionClass"
      self."RestrictedPython"
      self."zExceptions"
      self."zope.sequencesort"
      self."zope.structuredtext"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Document Templating Markup Language (DTML)";
      };
    };



    "ExtensionClass" = python.mkDerivation {
      name = "ExtensionClass-4.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/87/17/9568f8c251885a3d359b253f1959f5bd9f041eaf66db4370cb8e5ea0c9f2/ExtensionClass-4.1.2.tar.gz"; sha256 = "eaa5e0f37a8303e2d4a08f74d8dfadd34c9de0de789f6934590923d03b670199"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Metaclass for subclassable extension types";
      };
    };



    "Markdown" = python.mkDerivation {
      name = "Markdown-2.6.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9b/53/4492f2888408a2462fd7f364028b6c708f3ecaa52a028587d7dd729f40b4/Markdown-2.6.6.tar.gz"; sha256 = "9a292bb40d6d29abac8024887bcfc1159d7a32dc1d6f1f6e8d6d8e293666c504"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Python implementation of Markdown.";
      };
    };



    "Missing" = python.mkDerivation {
      name = "Missing-2.13.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/54/30/f37047f6ce32ace5be65a34db074c0757eefc304f507798a858690e46e6d/Missing-2.13.1.zip"; sha256 = "475f2751779cd9f9268073a3eb6fd2ceda7f45e595631c0988ae33db86821a0f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ExtensionClass"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Special Missing objects used in Zope2.";
      };
    };



    "MultiMapping" = python.mkDerivation {
      name = "MultiMapping-2.13.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f9/19/00998d8346ff71e92c6d9de24a75932e4183ad8ada59028359856cfcbbfe/MultiMapping-2.13.0.zip"; sha256 = "7bb014c10587245a8d2d90e7e39b4ae11973af44dd87c55436e09630af3ec661"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ExtensionClass"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Special MultiMapping objects used in Zope2.";
      };
    };



    "Persistence" = python.mkDerivation {
      name = "Persistence-2.13.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c1/f8/39c50b4d91f0aa0d28423159c6d16751b63de758a4e5358e98140ff987e7/Persistence-2.13.2.zip"; sha256 = "5a4500317a2c390609b20763b6e8e2e960df47d87adce98466e290e974fe2397"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ExtensionClass"
      self."ZODB3"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Persistent ExtensionClass";
      };
    };



    "Pillow" = python.mkDerivation {
      name = "Pillow-4.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8d/80/eca7a2d1a3c2dafb960f32f844d570de988e609f5fd17de92e1cf6a01b0a/Pillow-4.0.0.tar.gz"; sha256 = "ee26d2d7e7e300f76ba7b796014c04011394d0c4a5ed9a288264a3e443abca50"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."olefile"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "Standard PIL License";
        description = "Python Imaging Library (Fork)";
      };
    };



    "Plone" = python.mkDerivation {
      name = "Plone-5.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bf/7e/c4bcd13a3b9ba6e0723e5871fd368b834db04b434fdd95c76837ca3e290b/Plone-5.0.6.tar.gz"; sha256 = "7f4a38a4626b11bc6dcace493d3d53b0a82c929a74302dff484dd07bf7e1e66e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.ATContentTypes"
      self."Products.Archetypes"
      self."Products.CMFPlacefulWorkflow"
      self."Products.CMFPlone"
      self."plone.app.caching"
      self."plone.app.dexterity"
      self."plone.app.iterate"
      self."plone.app.openid"
      self."plone.app.upgrade"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "The Plone Content Management System";
      };
    };



    "Products.ATContentTypes" = python.mkDerivation {
      name = "Products.ATContentTypes-2.2.13";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9e/4b/c2da805e134eb865bf469457fd442c4efb5f9c8aa7d653eccc3ca0553a2a/Products.ATContentTypes-2.2.13.tar.gz"; sha256 = "cf4eab79fd1a7302774843f9a1d738ed4b56383ec939a840cdcb78b12fa95a2b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."ExtensionClass"
      self."Products.Archetypes"
      self."Products.CMFCore"
      self."Products.CMFDynamicViewFTI"
      self."Products.CMFFormController"
      self."Products.CMFPlone"
      self."Products.GenericSetup"
      self."Products.MimetypesRegistry"
      self."Products.PortalTransforms"
      self."Products.validation"
      self."ZConfig"
      self."ZODB3"
      self."Zope2"
      self."plone.app.blob"
      self."plone.app.collection"
      self."plone.app.folder"
      self."plone.app.layout"
      self."plone.app.widgets"
      self."plone.i18n"
      self."plone.memoize"
      self."transaction"
      self."zope.annotation"
      self."zope.component"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.publisher"
      self."zope.tal"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Default Content Types for Plone 2.1-4.3";
      };
    };



    "Products.Archetypes" = python.mkDerivation {
      name = "Products.Archetypes-1.10.15";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/c7/fbf9bba405b2029e3bcaf8db0716899e404e02b8659ab44f7c43bf71890f/Products.Archetypes-1.10.15.tar.gz"; sha256 = "ba520094d292c0c95a07d345a6dad80c4f383bd9c411b9b5458dfee50ea45b2d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."ExtensionClass"
      self."Products.CMFCore"
      self."Products.CMFFormController"
      self."Products.CMFQuickInstallerTool"
      self."Products.DCWorkflow"
      self."Products.GenericSetup"
      self."Products.MimetypesRegistry"
      self."Products.PlacelessTranslationService"
      self."Products.PortalTransforms"
      self."Products.ZSQLMethods"
      self."Products.statusmessages"
      self."Products.validation"
      self."ZODB3"
      self."Zope2"
      self."plone.app.folder"
      self."plone.app.widgets"
      self."plone.folder"
      self."plone.uuid"
      self."transaction"
      self."zope.annotation"
      self."zope.component"
      self."zope.contenttype"
      self."zope.datetime"
      self."zope.deferredimport"
      self."zope.event"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.publisher"
      self."zope.schema"
      self."zope.tal"
      self."zope.testing"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Archetypes is a developers framework for rapidly developing and deploying rich, full featured content types within the context of Zope/CMF and Plone.";
      };
    };



    "Products.BTreeFolder2" = python.mkDerivation {
      name = "Products.BTreeFolder2-2.14.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c4/dd/5da8431249f2e72bd31b500ec73b91aeca4b342afd44cba9094026d98e1b/Products.BTreeFolder2-2.14.0.tar.gz"; sha256 = "d234839b43d4c9869c19daef0b9882a97b77e789c0557f7a0b7998607f037b5d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Acquisition"
      self."ExtensionClass"
      self."Persistence"
      self."ZODB3"
      self."Zope2"
      self."zope.container"
      self."zope.event"
      self."zope.lifecycleevent"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "A BTree based implementation for Zope 2's OFS.";
      };
    };



    "Products.CMFCore" = python.mkDerivation {
      name = "Products.CMFCore-2.2.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/83/93/7340ae9f6546cf363ca0db84da7db6bfe9fcb525f13380377fbbdd47e113/Products.CMFCore-2.2.10.tar.gz"; sha256 = "3a24de464945f35d142e4659c62da887a19522e53cb74209f1554433b31e5560"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.GenericSetup"
      self."Products.ZSQLMethods"
      self."Zope2"
      self."five.localsitemanager"
      self."zope.app.publication"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Content Management Framework core components";
      };
    };



    "Products.CMFDiffTool" = python.mkDerivation {
      name = "Products.CMFDiffTool-3.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/38/f9/a6b512c1b4972e2f3923e934505043d9b115d6befe44b1609bdc02ffd5e4/Products.CMFDiffTool-3.1.2.tar.gz"; sha256 = "b49c452c8a2690d59a6f57d008d0f96032da1ebe15f6fda2c79609a1b9a5adc3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Zope2"
      self."plone.app.contenttypes"
      self."plone.app.dexterity"
      self."plone.namedfile"
      self."zope.component"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Diff tool for Plone";
      };
    };



    "Products.CMFDynamicViewFTI" = python.mkDerivation {
      name = "Products.CMFDynamicViewFTI-4.1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b4/1d/278296c739f15d02113e4b3c24a0015fe4d56d091227a776a0c9809234a2/Products.CMFDynamicViewFTI-4.1.4.tar.gz"; sha256 = "c11288051ba9edeb75fd97d618b9fb188f180f4ce665982657bb40cc0b45bc3d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."ExtensionClass"
      self."Products.Archetypes"
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Zope2"
      self."plone.app.contentmenu"
      self."zope.browsermenu"
      self."zope.component"
      self."zope.interface"
      self."zope.publisher"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ZPL";
        description = "CMFDynamicViewFTI is a product for dynamic views in CMF.";
      };
    };



    "Products.CMFEditions" = python.mkDerivation {
      name = "Products.CMFEditions-2.2.21";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/75/46/c3d12e392b3b166c9a1cb485315d0a8d2b1d74bed2b24730be980f37bbf1/Products.CMFEditions-2.2.21.tar.gz"; sha256 = "25c99fda774bd58833e1d063d1ff70aaf4d7f4f705df13c50b610e0c434a47f7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.Archetypes"
      self."Products.CMFCore"
      self."Products.CMFDiffTool"
      self."Products.CMFDynamicViewFTI"
      self."Products.CMFPlone"
      self."Products.CMFUid"
      self."Products.GenericSetup"
      self."Products.ZopeVersionControl"
      self."ZODB3"
      self."Zope2"
      self."transaction"
      self."zope.copy"
      self."zope.dottedname"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Versioning for Plone";
      };
    };



    "Products.CMFFormController" = python.mkDerivation {
      name = "Products.CMFFormController-3.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/73/06/b1b5966651e6de124fe4663c17357eb73852e668ff85c910926d9827891e/Products.CMFFormController-3.0.6.tar.gz"; sha256 = "a9be2f0ca9701487547f7732852f4a215593ef388cdd57c2018234e8261bcb02"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Zope2"
      self."transaction"
      self."zope.interface"
      self."zope.structuredtext"
      self."zope.tales"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "CMFFormController provides a form validation mechanism for CMF.";
      };
    };



    "Products.CMFPlacefulWorkflow" = python.mkDerivation {
      name = "Products.CMFPlacefulWorkflow-1.6.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cf/4e/05da0b0612a624e26fcc071605d194f1d809b5308c8349ea1fdc44b82988/Products.CMFPlacefulWorkflow-1.6.5.tar.gz"; sha256 = "2058db640f5a8fd5dbc0ee4f0f1e951a6ed5cd7e325dd649d6f0bb1ff3b5fb66"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Products.GenericSetup"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Workflow policies for Plone";
      };
    };



    "Products.CMFPlone" = python.mkDerivation {
      name = "Products.CMFPlone-5.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/54/20/baffb37d8a0885b08de1ae7a9a7dad9bee6510fe32a90beabbd6a0168bf5/Products.CMFPlone-5.0.6.tar.gz"; sha256 = "85cb293ad85c990604d893601a64362f3f9e83675935fb1bf9b1840331970e97"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."ExtensionClass"
      self."Pillow"
      self."Products.ATContentTypes"
      self."Products.CMFCore"
      self."Products.CMFDiffTool"
      self."Products.CMFDynamicViewFTI"
      self."Products.CMFEditions"
      self."Products.CMFQuickInstallerTool"
      self."Products.CMFUid"
      self."Products.DCWorkflow"
      self."Products.ExtendedPathIndex"
      self."Products.ExternalEditor"
      self."Products.GenericSetup"
      self."Products.MimetypesRegistry"
      self."Products.PasswordResetTool"
      self."Products.PlacelessTranslationService"
      self."Products.PlonePAS"
      self."Products.PluggableAuthService"
      self."Products.PluginRegistry"
      self."Products.PortalTransforms"
      self."Products.ResourceRegistries"
      self."Products.contentmigration"
      self."Products.statusmessages"
      self."ZODB3"
      self."Zope2"
      self."borg.localrole"
      self."cssmin"
      self."five.customerize"
      self."five.localsitemanager"
      self."five.pt"
      self."lxml"
      self."mockup"
      self."plone.api"
      self."plone.app.content"
      self."plone.app.contentlisting"
      self."plone.app.contentmenu"
      self."plone.app.contentrules"
      self."plone.app.contenttypes"
      self."plone.app.controlpanel"
      self."plone.app.customerize"
      self."plone.app.dexterity"
      self."plone.app.discussion"
      self."plone.app.folder"
      self."plone.app.i18n"
      self."plone.app.layout"
      self."plone.app.linkintegrity"
      self."plone.app.locales"
      self."plone.app.multilingual"
      self."plone.app.portlets"
      self."plone.app.redirector"
      self."plone.app.registry"
      self."plone.app.theming"
      self."plone.app.users"
      self."plone.app.uuid"
      self."plone.app.viewletmanager"
      self."plone.app.vocabularies"
      self."plone.app.workflow"
      self."plone.batching"
      self."plone.browserlayer"
      self."plone.contentrules"
      self."plone.i18n"
      self."plone.indexer"
      self."plone.intelligenttext"
      self."plone.locking"
      self."plone.memoize"
      self."plone.outputfilters"
      self."plone.portlet.collection"
      self."plone.portlet.static"
      self."plone.portlets"
      self."plone.protect"
      self."plone.registry"
      self."plone.schema"
      self."plone.session"
      self."plone.theme"
      self."plonetheme.barceloneta"
      self."slimit"
      self."transaction"
      self."z3c.autoinclude"
      self."zope.app.locales"
      self."zope.cachedescriptors"
      self."zope.component"
      self."zope.container"
      self."zope.deferredimport"
      self."zope.deprecation"
      self."zope.dottedname"
      self."zope.event"
      self."zope.globalrequest"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.location"
      self."zope.pagetemplate"
      self."zope.publisher"
      self."zope.site"
      self."zope.structuredtext"
      self."zope.tal"
      self."zope.tales"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "The Plone Content Management System (core)";
      };
    };



    "Products.CMFQuickInstallerTool" = python.mkDerivation {
      name = "Products.CMFQuickInstallerTool-3.0.13";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/5a/995a25ee9da675c24e56f2f1db903b252f3d7361244005fc17e63c9b926c/Products.CMFQuickInstallerTool-3.0.13.tar.gz"; sha256 = "0b8865ed94fbd572f1e21e5ae7754dd81f806a8d1ddcd1a36a0617caaf804a3e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Zope2"
      self."zope.annotation"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "A facility for comfortable activation/deactivation of CMF compliant add ons for Zope.";
      };
    };



    "Products.CMFUid" = python.mkDerivation {
      name = "Products.CMFUid-2.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9a/56/180db9ad4779da0ccf2b0fe1a829f38714b4321491945dcdcdb861127a04/Products.CMFUid-2.2.1.tar.gz"; sha256 = "19e769bd73027b6b2d7cc54c7dd9d91e043a5c362ffe9dcaf55b74ae144cdddb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Zope2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Uid product for the Zope Content Management Framework";
      };
    };



    "Products.DCWorkflow" = python.mkDerivation {
      name = "Products.DCWorkflow-2.2.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/96/7b/e61ea9587eb30b08a66dc8cc9d946a47e7eb036cead872a62f53ad386b3e/Products.DCWorkflow-2.2.5.tar.gz"; sha256 = "ed305a0f54f1e9f6852a69d589faa893b953dc8345e32238b82f1db3cccac26f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Zope2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "DCWorkflow product for the Zope Content Management Framework";
      };
    };



    "Products.DateRecurringIndex" = python.mkDerivation {
      name = "Products.DateRecurringIndex-2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cf/18/4959bf3e72720e107998975f2c14f61de9f035388557ffd756154f0d6f0e/Products.DateRecurringIndex-2.1.zip"; sha256 = "b9a5ab576c45c7ad95db1951fb8e56537707ebe82bbe32899ce2d28a61ef180c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."Zope2"
      self."plone.event"
      self."pytz"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Zope 2 date index with support for recurring events.";
      };
    };



    "Products.ExtendedPathIndex" = python.mkDerivation {
      name = "Products.ExtendedPathIndex-3.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8e/b2/93f3cad9729f22a6d7c3471d5ea58c38c4e0bfe98778aa763b554f462ce6/Products.ExtendedPathIndex-3.1.1.tar.gz"; sha256 = "8de7c8c6dd19f47d0cc2456db18464268cbfe0ec185dd1b37d631f2f74e0a1c4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."ZODB3"
      self."Zope2"
      self."transaction"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Zope catalog index for paths";
      };
    };



    "Products.ExternalEditor" = python.mkDerivation {
      name = "Products.ExternalEditor-1.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/14/9f/8f78c6377dad52a2600d9f3f7192e37b4441fa451532e2c5b737516e7945/Products.ExternalEditor-1.1.1.tar.gz"; sha256 = "7ed474b92283e18523904e62e5cfeda0b098d5bd3fa1ab2c7c632f81bdd596b9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope External Editor";
      };
    };



    "Products.ExternalMethod" = python.mkDerivation {
      name = "Products.ExternalMethod-2.13.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4c/4a/a8160b0e4ae6678aec02bc1b5d4db8a7b0265dd012a1cbe527a4460a17c9/Products.ExternalMethod-2.13.1.zip"; sha256 = "0caabb212fe8730b5e5f089f687d42a0f5a9997abcd11bf300b934e91b53dc6d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Acquisition"
      self."ExtensionClass"
      self."Persistence"
      self."ZODB3"
      self."Zope2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "This package provides support for external Python methods within a Zope 2 environment.";
      };
    };



    "Products.GenericSetup" = python.mkDerivation {
      name = "Products.GenericSetup-1.8.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/51/47/f63f5739d0ea62e899bf2f4ca61c30e0f063bcb97f608dd98918799551dc/Products.GenericSetup-1.8.3.tar.gz"; sha256 = "1594633ced1eac635969d4f1778c76ce9ebc4c4c7f7751d0d3d1726ea4def6ac"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."five.localsitemanager"
      self."zope.formlib"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Read Zope configuration state from profile dirs / tarballs";
      };
    };



    "Products.MIMETools" = python.mkDerivation {
      name = "Products.MIMETools-2.13.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/30/53/9e08e6a2f5e1c12b1d450c78025a54edbd70e40a15191de9e81839bad53a/Products.MIMETools-2.13.0.zip"; sha256 = "bb0f1384235813372b6a2e5ddcf60ac2dfd8903a7d5241a79d388dcfafca5bb7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."DocumentTemplate"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "MIMETools provides the &lt;!--#mime--&gt; tag for DocumentTemplate.";
      };
    };



    "Products.MailHost" = python.mkDerivation {
      name = "Products.MailHost-2.13.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fa/38/96b5f69c9fa11bc322b641b6517d51434d3b7573426ce1d9621fadc98a05/Products.MailHost-2.13.2.zip"; sha256 = "5ccd20d7cd7979a7cc4c1db04fafe542f29e1c2cde18f6289a5d0a342e843e3a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Acquisition"
      self."DateTime"
      self."DocumentTemplate"
      self."Persistence"
      self."Zope2"
      self."zope.deferredimport"
      self."zope.interface"
      self."zope.sendmail"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "zope.sendmail integration for Zope 2.";
      };
    };



    "Products.MimetypesRegistry" = python.mkDerivation {
      name = "Products.MimetypesRegistry-2.0.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/37/cf/96a0138a124d0b08833eb90ba447d7a10c23cad7897580b624ff86b2a486/Products.MimetypesRegistry-2.0.10.tar.gz"; sha256 = "430e0128b04d9e8655527bb34aba8a1777d819f0c796a325d23fcd4f0884a3fb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."ZODB3"
      self."Zope2"
      self."zope.contenttype"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "MIME type handling for Zope";
      };
    };



    "Products.OFSP" = python.mkDerivation {
      name = "Products.OFSP-2.13.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c9/a7/d9044a5fde407aaa8992f596962d325a6950d1f1e999d52d9914eca419d9/Products.OFSP-2.13.2.zip"; sha256 = "a3a831a0ff7b5befd722141de02bebe6fd63f961569b6b7504a99ca3515f357c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Persistence"
      self."Zope2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "General Zope 2 help screens.";
      };
    };



    "Products.PasswordResetTool" = python.mkDerivation {
      name = "Products.PasswordResetTool-2.2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/02/02/1025af9ff7efc51908ea3919bb19e9c4560b675e8f3a417ef44a75d18449/Products.PasswordResetTool-2.2.3.tar.gz"; sha256 = "764e78acdebe2b53d10c156554bc8b1c197a74de2ac388eb1a4ada4ddcbdb31b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Zope2"
      self."plone.app.registry"
      self."plone.memoize"
      self."zope.component"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Password reset tool for Plone";
      };
    };



    "Products.PlacelessTranslationService" = python.mkDerivation {
      name = "Products.PlacelessTranslationService-2.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/79/34/cd5cba4b273e4e5c65c148ae7a316392a2c3110a0f31acd879f4ca20f6d3/Products.PlacelessTranslationService-2.0.6.tar.gz"; sha256 = "9cfd2efea0756d0c34d0e742a0f4867403d408df884be3ade5b12a2425c72c2d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."ExtensionClass"
      self."ZODB3"
      self."Zope2"
      self."python-gettext"
      self."zope.annotation"
      self."zope.component"
      self."zope.deferredimport"
      self."zope.deprecation"
      self."zope.i18n"
      self."zope.interface"
      self."zope.publisher"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "PTS provides a way of internationalizing (i18n'ing) and localizing (l10n'ing) software for Zope 2.";
      };
    };



    "Products.PlonePAS" = python.mkDerivation {
      name = "Products.PlonePAS-5.0.11";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/38/86/7d597df105a0a0da0a771fc8ea9c8f291829f69f33165796560c78e3cf6f/Products.PlonePAS-5.0.11.tar.gz"; sha256 = "8b06d0729d85e07ed531c8d5510d203ab1fcdfe68cb9056ac7d184f41c0fd844"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Products.PluggableAuthService"
      self."Zope2"
      self."plone.i18n"
      self."plone.memoize"
      self."plone.protect"
      self."plone.session"
      self."zope.deprecation"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ZPL";
        description = "PlonePAS modifies the PluggableAuthService for use by Plone.";
      };
    };



    "Products.PluggableAuthService" = python.mkDerivation {
      name = "Products.PluggableAuthService-1.11.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cf/6a/57d824ba9ac9448186d97644b5040e86b753b8d0d5b9e9f222285fc94190/Products.PluggableAuthService-1.11.0.tar.gz"; sha256 = "53e2e79bd4b9c3ce87fde50fbc14f3159256f3f91e423157031a2833d2905fa0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.GenericSetup"
      self."Products.PluginRegistry"
      self."Zope2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Pluggable Zope2 authentication / authorization framework";
      };
    };



    "Products.PluginRegistry" = python.mkDerivation {
      name = "Products.PluginRegistry-1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7c/01/9af56277897e0c3f2fd745a9dfe0ef3b1ce13e5d487aac9049c99645e0e7/Products.PluginRegistry-1.4.tar.gz"; sha256 = "d9a9c67b0e4cb4322e54bbdda7e4419bd4d283d1b5174737e919e48a025bb017"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.GenericSetup"
      self."Zope2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Configure application plugins based on interfaces";
      };
    };



    "Products.PortalTransforms" = python.mkDerivation {
      name = "Products.PortalTransforms-2.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2d/4a/ba3bd4ae152a787ab33137626d24096ccac1d9aeaab0b853281e753dc8b7/Products.PortalTransforms-2.2.1.tar.gz"; sha256 = "a0ea886bd7daf14e854e92105f0466738a6b6d007cf513b2a88c1408781e0c71"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Markdown"
      self."Pillow"
      self."Products.Archetypes"
      self."Products.CMFCore"
      self."Products.MimetypesRegistry"
      self."ZODB3"
      self."Zope2"
      self."plone.intelligenttext"
      self."zope.interface"
      self."zope.structuredtext"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "";
        description = "MIME based content transformations";
      };
    };



    "Products.PythonScripts" = python.mkDerivation {
      name = "Products.PythonScripts-2.13.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/69/10/354788f825c17a015d189ce0e9c365934383f779b95ad585c170f7becdf8/Products.PythonScripts-2.13.2.zip"; sha256 = "c1ae5a73850a7fce5bfa4c1abd598149e9c6dc1f81271b002e4dc6f8fce595b5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Acquisition"
      self."DateTime"
      self."DocumentTemplate"
      self."RestrictedPython"
      self."Zope2"
      self."zExceptions"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Provides support for restricted execution of Python scripts in Zope 2.";
      };
    };



    "Products.ResourceRegistries" = python.mkDerivation {
      name = "Products.ResourceRegistries-3.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a0/ad/43cfe2fe958bed2199ae9bff960102e692cbcc697ebb9bd04cc02cb79bf5/Products.ResourceRegistries-3.0.4.tar.gz"; sha256 = "180ce15dd1531b74cb949095a196b13d5f61b3d671a7d3484de8d548a49bf5a2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."ZODB3"
      self."Zope2"
      self."plone.app.registry"
      self."plone.protect"
      self."zope.component"
      self."zope.contentprovider"
      self."zope.interface"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Registry for managing CSS and JS";
      };
    };



    "Products.SecureMailHost" = python.mkDerivation {
      name = "Products.SecureMailHost-1.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4e/e1/40c8da388e4bd0afb736a1aed9a84e55f99019d38eb0575739e32eda840e/Products.SecureMailHost-1.1.2.zip"; sha256 = "5c46b81c06e6555cf4c3ee9facbbab1d5cc75bc7b435b7db9f5bc0862ca7dae7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ZPL";
        description = "SecureMailHost is a reimplementation of the standard Zope2 MailHost with some security and usability enhancements.";
      };
    };



    "Products.StandardCacheManagers" = python.mkDerivation {
      name = "Products.StandardCacheManagers-2.13.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7f/a7/fb0ea5f0b3b189e7517580b6d84a5ed4ecc98bd2414bacc7c282c9bb28db/Products.StandardCacheManagers-2.13.1.tar.gz"; sha256 = "b27902493c85a08da2eba37691772d8eb9f04081c9b31bd3ab60d45834651dbd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Zope2"
      self."transaction"
      self."zope.component"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Cache managers for Zope 2.";
      };
    };



    "Products.ZCTextIndex" = python.mkDerivation {
      name = "Products.ZCTextIndex-2.13.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/34/6c/860664bdc23dc65362537b7b06f6113dcb062129e840ccab97bf11c87e4b/Products.ZCTextIndex-2.13.5.zip"; sha256 = "a431189e405ad927a1a10b1d230534f824d6be62a99b666a0747e7b1c1c28dfe"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Acquisition"
      self."Persistence"
      self."ZODB3"
      self."Zope2"
      self."transaction"
      self."zExceptions"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Full text indexing for ZCatalog / Zope 2.";
      };
    };



    "Products.ZCatalog" = python.mkDerivation {
      name = "Products.ZCatalog-3.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4d/d2/bf4f765265818c4ec3f59247c823b6ba10a654ed802498408e9ea38e14eb/Products.ZCatalog-3.0.2.zip"; sha256 = "09bf7381e041e7f21e0e50e3665cd73ee65ae9d6a769087f114b11dc326cc4e9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Acquisition"
      self."DateTime"
      self."DocumentTemplate"
      self."ExtensionClass"
      self."Missing"
      self."Persistence"
      self."Products.ZCTextIndex"
      self."Record"
      self."RestrictedPython"
      self."ZODB3"
      self."Zope2"
      self."zExceptions"
      self."zope.dottedname"
      self."zope.interface"
      self."zope.schema"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope 2's indexing and search solution.";
      };
    };



    "Products.ZSQLMethods" = python.mkDerivation {
      name = "Products.ZSQLMethods-2.13.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/14/44/0858196ab901ec80b214215bed0666070dbdcb7a9d4cbc415a9a463b12ea/Products.ZSQLMethods-2.13.4.zip"; sha256 = "9b1998a86319ec98b2151b74b410a13704cd8b6cf79acb7dcbcf64c81c70978a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."ExtensionClass"
      self."Missing"
      self."Persistence"
      self."Record"
      self."ZODB3"
      self."Zope2"
      self."transaction"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "SQL method support for Zope 2.";
      };
    };



    "Products.ZopeVersionControl" = python.mkDerivation {
      name = "Products.ZopeVersionControl-1.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ad/0b/3583950d36054fce946da737d168ba84d1bc3ebd4cb8026149b8bcc5a901/Products.ZopeVersionControl-1.1.3.zip"; sha256 = "8635339be3d469400aba9ab4eff17b9dd75248a4d4a8551f7201ab61eb8ea740"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."ZODB3"
      self."Zope2"
      self."transaction"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ZPL";
        description = "Zope Version Control";
      };
    };



    "Products.contentmigration" = python.mkDerivation {
      name = "Products.contentmigration-2.1.13";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f8/d3/c1456e236962bf0c92d36ae299e7a0ec2c112fa8bf786503072a4205455e/Products.contentmigration-2.1.13.tar.gz"; sha256 = "578c935195aaddf5d4f39f2393a84ab3e684d70d7b0dae837c867dbe4efeef55"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFPlone"
      self."Zope2"
      self."archetypes.schemaextender"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl3;
        description = "A generic content migration framework for Plone.";
      };
    };



    "Products.statusmessages" = python.mkDerivation {
      name = "Products.statusmessages-4.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/05/71/965364079250541945f0b8fb5a752e062c2b850e5e5dff711a0447c53137/Products.statusmessages-4.1.1.tar.gz"; sha256 = "5c2de452229705f52b754e55c45da096b170345a3f3d0db6e6b25385b4fc59fa"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."zope.annotation"
      self."zope.component"
      self."zope.i18n"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "statusmessages provides an easy way of handling internationalized status messages managed via an BrowserRequest adapter storing status messages in client-side cookies.";
      };
    };



    "Products.validation" = python.mkDerivation {
      name = "Products.validation-2.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b2/af/d02b43ed51b98b89c1ac321267c4ef3a509524183ef9ee5ac25b6d169434/Products.validation-2.0.2.tar.gz"; sha256 = "31528213d58046c448fe001b298eea7c0ba7a665a697b5f68884c16a2e43ebe9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.Archetypes"
      self."Zope2"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Data validation package for Archetypes";
      };
    };



    "Record" = python.mkDerivation {
      name = "Record-2.13.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7b/b5/def1a908f1435084e8ebd7a674e70a61fa0962dae79345b0e6320dc0cd9f/Record-2.13.0.zip"; sha256 = "71caed8d5c09f75a7469b310b18c077625390d28e9134f4399e4d31344fdac36"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ExtensionClass"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Special Record objects used in Zope2.";
      };
    };



    "RestrictedPython" = python.mkDerivation {
      name = "RestrictedPython-3.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/22/f1/557f90f0881f4b2d1d343bcae31f6dfa992a364bd51f1d8ca180249e62ad/RestrictedPython-3.6.0.zip"; sha256 = "0edb2579b4174282bee3997abc6316d122c7ca6dcd02f4423352213cde571434"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "RestrictedPython provides a restricted execution environment for Python, e.g. for running untrusted code.";
      };
    };



    "Unidecode" = python.mkDerivation {
      name = "Unidecode-0.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d2/c0/fd82d57ad948f005c8d96211249d3cb34ee57289d8e9eecf6bdda70b4bd6/Unidecode-0.04.1.tar.gz"; sha256 = "e3687492791cf9088fb17ac69b3d77223eeb13107fa6eff1806d6b63f9306343"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "";
        description = "US-ASCII transliterations of Unicode text";
      };
    };



    "ZConfig" = python.mkDerivation {
      name = "ZConfig-2.9.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6f/b9/730a2d0bd2fb67c4a2dddbc99c646825c473c7eb2b7bd57821d7f9049b31/ZConfig-2.9.3.tar.gz"; sha256 = "28aae6309cbf14fdf446a4d7331476633fdb07f0cdbc2bde1d1ab34a1c1f447d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Structured Configuration Library";
      };
    };



    "ZODB3" = python.mkDerivation {
      name = "ZODB3-3.10.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a1/eb/21069eb3e0297b247d21fab8c47ee5b73bf5057cea41472768091e7dc0cc/ZODB3-3.10.5.tar.gz"; sha256 = "c857d8a97d331351a3b964f841c263ebf39c862fe1103563fa020a7df1137338"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZConfig"
      self."transaction"
      self."zc.lockfile"
      self."zdaemon"
      self."zope.event"
      self."zope.interface"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Object Database: object database and persistence";
      };
    };



    "Zope2" = python.mkDerivation {
      name = "Zope2-2.13.24";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/48/d7/2ff85c1156ad6555749c4adab01da93d46ef93b4ce5a2825d0f695f42a04/Zope2-2.13.24.tar.gz"; sha256 = "cd677566cf298ca5eb1d9b2c4156aa74cfceadc75fea5d69529524a04d28785e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Acquisition"
      self."DateTime"
      self."DocumentTemplate"
      self."ExtensionClass"
      self."Missing"
      self."MultiMapping"
      self."Persistence"
      self."Products.BTreeFolder2"
      self."Products.ExternalMethod"
      self."Products.MIMETools"
      self."Products.MailHost"
      self."Products.OFSP"
      self."Products.PythonScripts"
      self."Products.StandardCacheManagers"
      self."Products.ZCTextIndex"
      self."Products.ZCatalog"
      self."Record"
      self."RestrictedPython"
      self."ZConfig"
      self."ZODB3"
      self."ZopeUndo"
      self."docutils"
      self."initgroups"
      self."pytz"
      self."tempstorage"
      self."transaction"
      self."zExceptions"
      self."zLOG"
      self."zdaemon"
      self."zope.browser"
      self."zope.browsermenu"
      self."zope.browserpage"
      self."zope.browserresource"
      self."zope.component"
      self."zope.configuration"
      self."zope.container"
      self."zope.contentprovider"
      self."zope.contenttype"
      self."zope.deferredimport"
      self."zope.event"
      self."zope.exceptions"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.location"
      self."zope.pagetemplate"
      self."zope.processlifetime"
      self."zope.proxy"
      self."zope.ptresource"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.sendmail"
      self."zope.sequencesort"
      self."zope.site"
      self."zope.size"
      self."zope.structuredtext"
      self."zope.tal"
      self."zope.tales"
      self."zope.testbrowser"
      self."zope.testing"
      self."zope.traversing"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope2 application server / web framework";
      };
    };



    "ZopeUndo" = python.mkDerivation {
      name = "ZopeUndo-2.12.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/59/b3/891937a2193b0a6a9c6a058ec3a426be75b7a83c9409b2bebe5d2a6d67ba/ZopeUndo-2.12.0.zip"; sha256 = "5f2c077a23834773668a9badcffcaa227d2ee9b231d20ed8103b19be5cdf343d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "ZODB undo support for Zope2.";
      };
    };



    "archetypes.multilingual" = python.mkDerivation {
      name = "archetypes.multilingual-3.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/c8/d160ecf7b940a7cd3d5eba74090a32695fe4bc36a7fa83a4d0926347825a/archetypes.multilingual-3.0.3.tar.gz"; sha256 = "d179f80f427811d284b23c894d0e8f13e331794f961f820c25d1c207081c66fa"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.ATContentTypes"
      self."collective.monkeypatcher"
      self."plone.app.multilingual"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Multilingual support for archetypes.";
      };
    };



    "archetypes.schemaextender" = python.mkDerivation {
      name = "archetypes.schemaextender-2.1.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e8/a8/fc1bba4856e3f3573234da9dc3a620fd14bd70b9f47eb719a603ca9e0799/archetypes.schemaextender-2.1.6.tar.gz"; sha256 = "a5dc2dcf37f673900631c8cb22e5cfe5506037d99d870394d38561cb0c5e63cd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.uuid"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Dynamically extend Archetypes schemas with named adapters.";
      };
    };



    "borg.localrole" = python.mkDerivation {
      name = "borg.localrole-3.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3e/0c/43ae88ce4e218a9f267f5a81a063f52ed09b8f95069f648cf979f34b4c6c/borg.localrole-3.1.2.tar.gz"; sha256 = "fda7010ae863de3eb62a2ce0b687e5bfcabc561e22875b3842255bcc05a3349c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.ATContentTypes"
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Products.PlonePAS"
      self."Products.PluggableAuthService"
      self."Zope2"
      self."plone.memoize"
      self."zope.annotation"
      self."zope.component"
      self."zope.deferredimport"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl2;
        description = "A PAS plugin which can manage local roles via an adapter lookup on the current context";
      };
    };



    "collective.elephantvocabulary" = python.mkDerivation {
      name = "collective.elephantvocabulary-0.2.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/93/f1/a86cb423095229d11544199a5cd64151deffdacc85bda28b300ea3ee7602/collective.elephantvocabulary-0.2.5.zip"; sha256 = "a3f4ef008767007845ac7f792fd468936c192adc33d0be945814b8a609a8c01b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.registry"
      self."zope.component"
      self."zope.dottedname"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "type of zope vocabularies that dont \"forget\", like                    elephants";
      };
    };



    "collective.monkeypatcher" = python.mkDerivation {
      name = "collective.monkeypatcher-1.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/45/75/01e1e4cd8b13ffe3081a0b8cb45e3f1df49c93389a128dd6cee567666dfb/collective.monkeypatcher-1.1.2.tar.gz"; sha256 = "2a6b19d204a22235b23201d47f59e37cb2adc7ccc7c700630659a2c2576b3fc2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Support for applying monkey patches late in the startup cycle by using ZCML configuration actions";
      };
    };



    "cssmin" = python.mkDerivation {
      name = "cssmin-0.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8e/d8/dc9da69bb186303f7ab41adef0a5b6d34da2fdba006827620877760241c3/cssmin-0.2.0.tar.gz"; sha256 = "e012f0cc8401efcf2620332339011564738ae32be8c84b2e43ce8beaec1067b6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "";
        description = "A Python port of the YUI CSS compression algorithm.";
      };
    };



    "cssselect" = python.mkDerivation {
      name = "cssselect-0.9.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/11/21/47b5d2696a945da177d2344b6e330b7b0d1c52404063cb387d2261517ccb/cssselect-0.9.2.tar.gz"; sha256 = "713b5b99ef08022257b3409c7ae1b18b2c6536b3f155e6237c5cfba0f67ae6f5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "cssselect parses CSS3 Selectors and translates them to XPath 1.0";
      };
    };



    "decorator" = python.mkDerivation {
      name = "decorator-4.0.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/13/8a/4eed41e338e8dcc13ca41c94b142d4d20c0de684ee5065523fee406ce76f/decorator-4.0.10.tar.gz"; sha256 = "9c6e98edcb33499881b86ede07d9968c81ab7c769e28e9af24075f0a5379f070"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Better living through Python with decorators";
      };
    };



    "diazo" = python.mkDerivation {
      name = "diazo-1.2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/24/ea/f9951a371b7170f43f9cf348121476c602e91e58b7115d456d39ab1323f8/diazo-1.2.3.tar.gz"; sha256 = "37b71fa34be6e11be44b9734dfcb880d2b6fc3d0819c24a7aa886d96b043f0d6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cssselect"
      self."future"
      self."lxml"
      self."repoze.xmliter"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "New BSD";
        description = "Diazo implements a Deliverance like language using a pure
        XSLT engine. With Diazo, you \"compile\" your theme and ruleset in one
        step, then use a superfast/simple transform on each request thereafter.
        Alternatively, compile your theme during development, check it into
        version control, and not touch Diazo during deployment.";
      };
    };



    "docutils" = python.mkDerivation {
      name = "docutils-0.12";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/37/38/ceda70135b9144d84884ae2fc5886c6baac4edea39550f28bcd144c1234d/docutils-0.12.tar.gz"; sha256 = "c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.publicDomain;
        description = "Docutils -- Python Documentation Utilities";
      };
    };



    "feedparser" = python.mkDerivation {
      name = "feedparser-5.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/91/d8/7d37fec71ff7c9dbcdd80d2b48bcdd86d6af502156fc93846fb0102cb2c4/feedparser-5.2.1.tar.bz2"; sha256 = "ce875495c90ebd74b179855449040003a1beb40cd13d5f037a0654251e260b02"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "License :: OSI Approved";
        description = "Universal feed parser, handles RSS 0.9x, RSS 1.0, RSS 2.0, CDF, Atom 0.3, and Atom 1.0 feeds";
      };
    };



    "five.customerize" = python.mkDerivation {
      name = "five.customerize-1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6e/01/7c6898d76b50608141e84d3092760f8b078b65b46b4b556fa7d25e589e1b/five.customerize-1.1.zip"; sha256 = "3c1cb663c3bc9e8245291768f708e634b6da0bdd55a2c94e9c8e4a29623ad809"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Zope2"
      self."plone.portlets"
      self."transaction"
      self."zope.component"
      self."zope.componentvocabulary"
      self."zope.dottedname"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.pagetemplate"
      self."zope.publisher"
      self."zope.schema"
      self."zope.site"
      self."zope.testing"
      self."zope.traversing"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "TTW customization of template-based Zope views";
      };
    };



    "five.globalrequest" = python.mkDerivation {
      name = "five.globalrequest-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d8/0a/7517a99f29dc49dc35e46c6e1a43fddaeccb5a4c960564e58a2a97a16180/five.globalrequest-1.0.tar.gz"; sha256 = "f861e68e0c2397ab84091263753964159fde7e89d19e667a632ac0e625eb5346"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."zope.globalrequest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ZPL";
        description = "Zope 2 integration for zope.globalrequest";
      };
    };



    "five.intid" = python.mkDerivation {
      name = "five.intid-1.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2f/34/9a60edd90f0f6df3b9333997953022a4187aa2f0eec21b7b0c9ac1e68b7b/five.intid-1.1.1.tar.gz"; sha256 = "a38f805162db335c7157838717ec1f832da26dfc8854a90dd739b7c0909168c0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Zope2"
      self."five.localsitemanager"
      self."zope.component"
      self."zope.event"
      self."zope.interface"
      self."zope.intid"
      self."zope.keyreference"
      self."zope.lifecycleevent"
      self."zope.location"
      self."zope.site"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ZPL";
        description = "Zope2 support for zope.intid";
      };
    };



    "five.localsitemanager" = python.mkDerivation {
      name = "five.localsitemanager-2.0.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/48/31/d93ec8f642c6d66a68ee5c1fb0309f6f3cf17ca7210a69ef8457f62658e1/five.localsitemanager-2.0.5.zip"; sha256 = "043cf6aace227f1fa2d91b69be38334b2af71c0514a059583e83bacc175f05dd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."ZODB3"
      self."Zope2"
      self."zope.component"
      self."zope.event"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.location"
      self."zope.site"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Local site manager implementation for Zope 2";
      };
    };



    "five.pt" = python.mkDerivation {
      name = "five.pt-2.2.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/66/b7/ebdf949b754425138c7285f7d1c94295e7399f8090b3f93c149eabb1d9af/five.pt-2.2.4.tar.gz"; sha256 = "d9617d397ddf66d90debc243275fec661d61ee8594475712eb86ede47b6b1d50"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Chameleon"
      self."sourcecodegen"
      self."z3c.pt"
      self."zope.pagetemplate"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ZPL";
        description = "Five bridges and patches to use Chameleon with Zope.";
      };
    };



    "future" = python.mkDerivation {
      name = "future-0.15.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5a/f4/99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3d/future-0.15.2.tar.gz"; sha256 = "3d3b193f20ca62ba7d8782589922878820d0a023b885882deec830adbf639b97"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Clean single-source support for Python 3 and 2";
      };
    };



    "icalendar" = python.mkDerivation {
      name = "icalendar-3.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3f/40/a479fd8d450e06ab0965227b3231ac3c4479dbaf424fdbdd1045809dc434/icalendar-3.10.tar.gz"; sha256 = "472f01da00e1e28eaf0cf03cc872c4cbce22dab50629ea9e72470761c6b45505"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."python-dateutil"
      self."pytz"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "iCalendar parser/generator";
      };
    };



    "initgroups" = python.mkDerivation {
      name = "initgroups-2.13.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bc/a5/b31a91d30f8008f7c8a8e1a56549f291fd0d5f4569ca7be6cc4bb033a83b/initgroups-2.13.0.zip"; sha256 = "b34e1c9f2ec7c1a3bb602df9a0bb6027e18f0bdbe12288c437ab3cf7d8a91138"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Convenience uid/gid helper function used in Zope2.";
      };
    };



    "lxml" = python.mkDerivation {
      name = "lxml-3.5.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8b/be/ed850baac891aca25c832fb8d7b9c0e7a5077a30e336d95ffc7d649aaa06/lxml-3.5.0.tar.gz"; sha256 = "349f93e3a4b09cc59418854ab8013d027d246757c51744bf20069bc89016f578"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cssselect"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API.";
      };
    };



    "mechanize" = python.mkDerivation {
      name = "mechanize-0.2.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/32/bc/d5b44fe4a3b5079f035240a7c76bd0c71a60c6082f4bfcb1c7585604aa35/mechanize-0.2.5.tar.gz"; sha256 = "2e67b20d107b30c00ad814891a095048c35d9d8cb9541801cebe85684cc84766"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Stateful programmatic web browsing.";
      };
    };



    "mockup" = python.mkDerivation {
      name = "mockup-2.1.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/ee/1eca7903d51afca5ac4b679601d976f9c3361279b23bed7a3030aeb6a22e/mockup-2.1.5.tar.gz"; sha256 = "14b249bb7a0876540a5892bfd6139fa314f34e80f51f2060ec477f58ad4efd87"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "A collection of client side patterns for faster and easier web development";
      };
    };



    "olefile" = python.mkDerivation {
      name = "olefile-0.44";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/35/17/c15d41d5a8f8b98cc3df25eb00c5cee76193114c78e5674df6ef4ac92647/olefile-0.44.zip"; sha256 = "61f2ca0cd0aa77279eb943c07f607438edf374096b66332fae1ee64a6f0f73ad"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Python package to parse, read and write Microsoft OLE2 files (Structured Storage or Compound Document, Microsoft Office) - Improved version of the OleFileIO module from PIL, the Python Image Library.";
      };
    };



    "plone.alterego" = python.mkDerivation {
      name = "plone.alterego-1.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2b/b4/c67f61f5022675230b2e1884a99c7ac5ed3631e2eb2626bbeae335fe7f5f/plone.alterego-1.0.1.tar.gz"; sha256 = "493a43ff8834c520aef8299517594e2caaf63ee2cc5fef790cbc914d31122422"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl3;
        description = "Low level support for dynamic modules";
      };
    };



    "plone.api" = python.mkDerivation {
      name = "plone.api-1.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5a/57/e799732b632f9d2fb4a9d50a3cd56007ae5a9c2169bc70cb86732e7eeacb/plone.api-1.5.tar.gz"; sha256 = "3fda4f987a7fb890f34960e191b105e8e481b5ee950452816ebaa3ad06b88a10"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.Archetypes"
      self."Products.CMFPlone"
      self."Products.statusmessages"
      self."decorator"
      self."plone.app.dexterity"
      self."plone.app.uuid"
      self."plone.indexer"
      self."plone.registry"
      self."plone.uuid"
      self."zope.globalrequest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl2;
        description = "A Plone API.";
      };
    };



    "plone.app.blob" = python.mkDerivation {
      name = "plone.app.blob-1.6.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1b/fb/4dfd77420b5e57340a9164206abe5e3a9c64b4cbbfb513652f3f4d518e86/plone.app.blob-1.6.4.tar.gz"; sha256 = "89cbf4f0f4b3289a017fd245fd55e93f28f9ca27b1406b6950a0e5b9e7cbe0fc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.MimetypesRegistry"
      self."Products.contentmigration"
      self."ZODB3"
      self."archetypes.schemaextender"
      self."collective.monkeypatcher"
      self."plone.app.imaging"
      self."plone.scale"
      self."zope.proxy"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "ZODB blob support for Plone";
      };
    };



    "plone.app.caching" = python.mkDerivation {
      name = "plone.app.caching-1.2.11";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/da/83/b2b12f499b5973b492d0caac2e0f2a574b89124a2f2c412a1b7a65016947/plone.app.caching-1.2.11.tar.gz"; sha256 = "c4518dc7a0b90eb998a61fd0eb15036b003e8f1117f943dc6f5e1d92cb11f113"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."Products.CMFDynamicViewFTI"
      self."Products.GenericSetup"
      self."Products.statusmessages"
      self."Zope2"
      self."plone.app.contenttypes"
      self."plone.app.registry"
      self."plone.app.z3cform"
      self."plone.cachepurging"
      self."plone.caching"
      self."plone.memoize"
      self."plone.protect"
      self."plone.registry"
      self."python-dateutil"
      self."z3c.form"
      self."z3c.zcmlhook"
      self."zope.browserresource"
      self."zope.component"
      self."zope.interface"
      self."zope.pagetemplate"
      self."zope.publisher"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Plone UI and default rules for plone.caching/z3c.caching";
      };
    };



    "plone.app.collection" = python.mkDerivation {
      name = "plone.app.collection-1.1.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/eb/b4/b561adaa9ba5ffafa6dbdf59a8c96c7b419c27b753d9d3d9abbee8389fd9/plone.app.collection-1.1.6.tar.gz"; sha256 = "bb9881324394c5024f82ef66e35d17317ba60ad73a3f759d6299f23d68327f70"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.ATContentTypes"
      self."Products.Archetypes"
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Products.CMFQuickInstallerTool"
      self."Products.validation"
      self."Zope2"
      self."plone.app.contentlisting"
      self."plone.app.portlets"
      self."plone.app.querystring"
      self."plone.app.vocabularies"
      self."plone.app.widgets"
      self."plone.portlet.collection"
      self."plone.portlets"
      self."transaction"
      self."zope.component"
      self."zope.configuration"
      self."zope.formlib"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "This package adds 'saved search' functionality to Plone.";
      };
    };



    "plone.app.content" = python.mkDerivation {
      name = "plone.app.content-3.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/43/fa/8828a082d61c79b923e551b68f411f4b1140c776df736b3ab31635f72789/plone.app.content-3.2.tar.gz"; sha256 = "85e824f7f5c6a65cec4da1c51e2f7721af5122c979878ec985b19d28d9118f64"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."Products.CMFDynamicViewFTI"
      self."Products.CMFPlone"
      self."Zope2"
      self."plone.app.contenttypes"
      self."plone.app.widgets"
      self."plone.batching"
      self."plone.i18n"
      self."plone.memoize"
      self."plone.protect"
      self."zope.component"
      self."zope.container"
      self."zope.deferredimport"
      self."zope.event"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.publisher"
      self."zope.schema"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Content Views for Plone";
      };
    };



    "plone.app.contentlisting" = python.mkDerivation {
      name = "plone.app.contentlisting-1.2.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/47/64/d21bcf13b90aff0bff325e88b321683c162d5ba7eb6bc78c7b518185b45d/plone.app.contentlisting-1.2.7.tar.gz"; sha256 = "0f81bb2eeb2c746cc976f3e32300369b7c20753362aa3ad6757084bc67d8cd17"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFPlone"
      self."plone.app.contenttypes"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL version 2";
        description = "Listing of content for the Plone CMS";
      };
    };



    "plone.app.contentmenu" = python.mkDerivation {
      name = "plone.app.contentmenu-2.1.8";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1c/46/5ec4d973f29b056b8f0c143937dc5a5ddda3fc7680bed70cc0f2c4d0b77e/plone.app.contentmenu-2.1.8.tar.gz"; sha256 = "12dac2a717996bbeb045bfcbe8ff1e3d51fe3b03d3afe120cf7f32d55189f203"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."Products.CMFDynamicViewFTI"
      self."Products.CMFPlone"
      self."Zope2"
      self."plone.app.content"
      self."plone.app.contenttypes"
      self."plone.locking"
      self."plone.memoize"
      self."plone.protect"
      self."zope.browsermenu"
      self."zope.component"
      self."zope.contentprovider"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.publisher"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Plone's content menu implementation";
      };
    };



    "plone.app.contentrules" = python.mkDerivation {
      name = "plone.app.contentrules-4.0.11";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/19/be/af91430ac6e42891b7c5b32c71d543cef4733b8481853a02de0ac0ef3e72/plone.app.contentrules-4.0.11.tar.gz"; sha256 = "1c36334509d66ecc892d76b9fd1b15fa1bfdb63749d5a5fccebe2ab32d473c39"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Products.GenericSetup"
      self."Products.statusmessages"
      self."ZODB3"
      self."Zope2"
      self."plone.app.vocabularies"
      self."plone.app.z3cform"
      self."plone.autoform"
      self."plone.contentrules"
      self."plone.memoize"
      self."plone.stringinterp"
      self."plone.uuid"
      self."transaction"
      self."zope.annotation"
      self."zope.browser"
      self."zope.component"
      self."zope.container"
      self."zope.event"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.publisher"
      self."zope.schema"
      self."zope.site"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Plone integration for plone.contentrules";
      };
    };



    "plone.app.contenttypes" = python.mkDerivation {
      name = "plone.app.contenttypes-1.2.17";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/03/7c/ec973dda135e531d8d21ea2ee513fbc98ca37498c76e7e24226820666e35/plone.app.contenttypes-1.2.17.tar.gz"; sha256 = "ef7b24ebb52ecfcdd9a407a5b6a90893603ab70676c60502114cee2e89b82c3f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.ATContentTypes"
      self."Products.CMFPlone"
      self."Products.contentmigration"
      self."archetypes.schemaextender"
      self."lxml"
      self."plone.app.contentmenu"
      self."plone.app.dexterity"
      self."plone.app.event"
      self."plone.app.linkintegrity"
      self."plone.app.lockingbehavior"
      self."plone.app.querystring"
      self."plone.app.relationfield"
      self."plone.app.versioningbehavior"
      self."plone.app.z3cform"
      self."plone.dexterity"
      self."plone.namedfile"
      self."pytz"
      self."zope.deprecation"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Default content types for Plone based on Dexterity";
      };
    };



    "plone.app.controlpanel" = python.mkDerivation {
      name = "plone.app.controlpanel-3.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/19/fd/ad1eec5a59f96b7a99bd60d235052a73ca0be744ea26eec30117f203592f/plone.app.controlpanel-3.0.4.tar.gz"; sha256 = "9b9379d6ec9c11b1723be1dda51fe1a4c5bae8fbc4d499b1e408a45ac81c7545"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFPlone"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Formlib-based controlpanels for Plone.";
      };
    };



    "plone.app.customerize" = python.mkDerivation {
      name = "plone.app.customerize-1.3.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1f/ef/319a54e1713a21dc349b9335ce699376f5ee288d36b892e563414df0a52f/plone.app.customerize-1.3.5.tar.gz"; sha256 = "691dd2a996159a7bee9c9c24f165156b96a4f6cd1459508aad5cc18d725c99eb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."Zope2"
      self."five.customerize"
      self."plone.app.layout"
      self."plone.browserlayer"
      self."plone.portlets"
      self."zope.component"
      self."zope.interface"
      self."zope.publisher"
      self."zope.testing"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Integrate five.customerize into Plone.";
      };
    };



    "plone.app.dexterity" = python.mkDerivation {
      name = "plone.app.dexterity-2.3.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/84/27/482da51373c5934c97a19b368c10bd1eb7234a231254dbff8d063622acf7/plone.app.dexterity-2.3.2.tar.gz"; sha256 = "49d87a4a2e0e2f5250b37573f4012248aa1bc68d37687758bc198691238a9f5c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Products.GenericSetup"
      self."Zope2"
      self."lxml"
      self."plone.app.content"
      self."plone.app.intid"
      self."plone.app.layout"
      self."plone.app.relationfield"
      self."plone.app.textfield"
      self."plone.app.uuid"
      self."plone.app.z3cform"
      self."plone.autoform"
      self."plone.behavior"
      self."plone.contentrules"
      self."plone.dexterity"
      self."plone.formwidget.namedfile"
      self."plone.namedfile"
      self."plone.portlets"
      self."plone.rfc822"
      self."plone.schemaeditor"
      self."plone.supermodel"
      self."plone.z3cform"
      self."z3c.form"
      self."z3c.relationfield"
      self."zope.browserpage"
      self."zope.component"
      self."zope.deprecation"
      self."zope.interface"
      self."zope.publisher"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Dexterity is a content type framework for CMF applications, with particular emphasis on Plone. It can be viewed as an alternative to Archetypes that is more light-weight and modular.";
      };
    };



    "plone.app.discussion" = python.mkDerivation {
      name = "plone.app.discussion-2.4.17";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/85/0b/d31a656bfec568e281a85171ae8bcad804a415e287421573b030e38b577f/plone.app.discussion-2.4.17.tar.gz"; sha256 = "a5c055d57f18b7d5dc51a5fc061f83f134465f20dcb018e50b9f8affb6886e44"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFPlone"
      self."ZODB3"
      self."plone.app.contentrules"
      self."plone.app.contenttypes"
      self."plone.app.layout"
      self."plone.app.registry"
      self."plone.app.uuid"
      self."plone.app.z3cform"
      self."plone.contentrules"
      self."plone.indexer"
      self."plone.registry"
      self."plone.stringinterp"
      self."plone.z3cform"
      self."z3c.form"
      self."zope.annotation"
      self."zope.component"
      self."zope.container"
      self."zope.event"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.site"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Enhanced discussion support for Plone";
      };
    };



    "plone.app.event" = python.mkDerivation {
      name = "plone.app.event-2.0.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a7/81/391321e56d429571a2bea7745283dd29572e238b056aa8d4ad0250757f25/plone.app.event-2.0.10.tar.gz"; sha256 = "8d29062676bd147b895f6cbf966b36a4c90e4f28ce030a2e2843c80ca1c9fc6d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Products.DateRecurringIndex"
      self."Products.GenericSetup"
      self."Products.ZCatalog"
      self."Products.statusmessages"
      self."Zope2"
      self."collective.elephantvocabulary"
      self."icalendar"
      self."plone.app.contentlisting"
      self."plone.app.contenttypes"
      self."plone.app.dexterity"
      self."plone.app.layout"
      self."plone.app.portlets"
      self."plone.app.querystring"
      self."plone.app.registry"
      self."plone.app.textfield"
      self."plone.app.vocabularies"
      self."plone.app.widgets"
      self."plone.app.z3cform"
      self."plone.autoform"
      self."plone.behavior"
      self."plone.browserlayer"
      self."plone.dexterity"
      self."plone.event"
      self."plone.folder"
      self."plone.formwidget.recurrence"
      self."plone.indexer"
      self."plone.memoize"
      self."plone.namedfile"
      self."plone.portlets"
      self."plone.registry"
      self."plone.supermodel"
      self."plone.uuid"
      self."plone.z3cform"
      self."pytz"
      self."transaction"
      self."z3c.form"
      self."zExceptions"
      self."zope.annotation"
      self."zope.component"
      self."zope.container"
      self."zope.contentprovider"
      self."zope.event"
      self."zope.globalrequest"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.publisher"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl2;
        description = "The Plone calendar framework";
      };
    };



    "plone.app.folder" = python.mkDerivation {
      name = "plone.app.folder-1.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b5/b1/6105075939d7388c335b5da0e3f6c4e4cdccaba0866eff85b3861ea8ea77/plone.app.folder-1.2.0.tar.gz"; sha256 = "098b64e3dc297ed57e7fa7c9893e3a613ab72c662efab439fe889d5211d75a6d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.ATContentTypes"
      self."Products.Archetypes"
      self."Products.BTreeFolder2"
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Zope2"
      self."plone.app.layout"
      self."plone.folder"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Integration package for `plone.folder` into Plone";
      };
    };



    "plone.app.i18n" = python.mkDerivation {
      name = "plone.app.i18n-3.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7e/ce/e2152c53e1c35988a251d52120bbb62c408d99554f3bfa7dde63b67f8317/plone.app.i18n-3.0.3.tar.gz"; sha256 = "271be3f7e734c0fdf79b8104203428982bfe0661893403d750f9b862f511b9e0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Plone specific i18n extensions.";
      };
    };



    "plone.app.imaging" = python.mkDerivation {
      name = "plone.app.imaging-2.0.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a2/e8/852dc144181403cbdf56e3263384240b7b67e9e3220ade7863ce1b0f4257/plone.app.imaging-2.0.5.tar.gz"; sha256 = "d2d8f6b718ca5f12b56bdb27f72acc135dca458a729fcb841f8cff6e523f8515"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.ATContentTypes"
      self."Products.Archetypes"
      self."five.globalrequest"
      self."plone.app.controlpanel"
      self."plone.scale"
      self."z3c.caching"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "User-configurable, blob-aware image scaling for Plone.";
      };
    };



    "plone.app.intid" = python.mkDerivation {
      name = "plone.app.intid-1.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2b/fb/f4f2f4318248f3b11dda570fae90fcf45bb280b80d65f2f0a00cf5b43acc/plone.app.intid-1.1.2.tar.gz"; sha256 = "c3d7a72e96bdfc92009334ef393ef7f9729ae3000eb672373884e59d7d27f681"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."five.intid"
      self."plone.dexterity"
      self."zope.intid"
      self."zope.lifecycleevent"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Installation and migration support for five.intid within Plone/CMF";
      };
    };



    "plone.app.iterate" = python.mkDerivation {
      name = "plone.app.iterate-3.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/04/c5/e5ddb62b0c80850844df25a3410b51682ec0a9bff015fd65f31695e47878/plone.app.iterate-3.2.1.tar.gz"; sha256 = "4375d8ac8a18c377b691c56f219519d226ad5c0dd474afb1c72d9ac79974154c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.Archetypes"
      self."Products.CMFCore"
      self."Products.CMFEditions"
      self."Products.CMFPlacefulWorkflow"
      self."Products.DCWorkflow"
      self."Products.GenericSetup"
      self."Products.statusmessages"
      self."ZODB3"
      self."Zope2"
      self."plone.app.contenttypes"
      self."plone.locking"
      self."plone.memoize"
      self."zope.annotation"
      self."zope.component"
      self."zope.event"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.schema"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "check-out/check-in staging for Plone";
      };
    };



    "plone.app.layout" = python.mkDerivation {
      name = "plone.app.layout-2.5.20";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/71/cd/6b6b0ae7bd07dd81c796b4bf834c6d5e367ee7b1473902a3beac5bdb7ba5/plone.app.layout-2.5.20.tar.gz"; sha256 = "ec951259fd9f60677ddb8e2bc7b1ff0c2c96df6eff567c794014f29213e515f3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.CMFCore"
      self."Products.CMFDynamicViewFTI"
      self."Products.CMFEditions"
      self."Products.CMFPlone"
      self."Zope2"
      self."plone.app.content"
      self."plone.app.contenttypes"
      self."plone.app.intid"
      self."plone.app.portlets"
      self."plone.app.relationfield"
      self."plone.app.viewletmanager"
      self."plone.batching"
      self."plone.dexterity"
      self."plone.i18n"
      self."plone.locking"
      self."plone.memoize"
      self."plone.portlets"
      self."plone.registry"
      self."z3c.relationfield"
      self."zope.annotation"
      self."zope.component"
      self."zope.deferredimport"
      self."zope.deprecation"
      self."zope.dottedname"
      self."zope.i18n"
      self."zope.interface"
      self."zope.publisher"
      self."zope.schema"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Layout mechanisms for Plone";
      };
    };



    "plone.app.linkintegrity" = python.mkDerivation {
      name = "plone.app.linkintegrity-3.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2a/40/e302ca4bda574bfc4f9b11b2cfca64781791cccf61f4fdda444f8e3cdd92/plone.app.linkintegrity-3.0.6.tar.gz"; sha256 = "0b6d1175572e6e4bf362bb2da3c7fc64f364f6e8a4211a81e6f30641ffcf44da"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.app.contenttypes"
      self."plone.app.dexterity"
      self."plone.app.intid"
      self."plone.app.relationfield"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl2;
        description = "Manage link integrity in Plone.";
      };
    };



    "plone.app.locales" = python.mkDerivation {
      name = "plone.app.locales-5.0.11";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d0/6b/0663a88b6c9ead5e89c780279e03c1e506fbdf3e203ddf3291d5b8433505/plone.app.locales-5.0.11.tar.gz"; sha256 = "3c6ddd4d0800f56f6a13f63c320b2f55ccf448f7b7cfb1caa1dc9aba4f15fa3c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Translation files for Plone";
      };
    };



    "plone.app.lockingbehavior" = python.mkDerivation {
      name = "plone.app.lockingbehavior-1.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cb/35/867e35b70433bf7d4d63bfbd4c078f54740659a6bd81818c602d4d2d6272/plone.app.lockingbehavior-1.0.4.tar.gz"; sha256 = "6ffbd6455bcd2623807baf2a07dabdd3a07b776b1695d921e91d110aca04df95"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.app.locales"
      self."plone.behavior"
      self."plone.dexterity"
      self."plone.locking"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL2";
        description = "Locking integration for dexterity content objects.";
      };
    };



    "plone.app.multilingual" = python.mkDerivation {
      name = "plone.app.multilingual-4.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ed/64/90fdadf01541b766245aebf05f005649730eb21ad54e5bb0107f1997254d/plone.app.multilingual-4.0.3.tar.gz"; sha256 = "4dcfc667761e7368c97ed3ae563d41692807d8182280d9df8aff522ba74c052e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFPlone"
      self."Products.GenericSetup"
      self."archetypes.multilingual"
      self."decorator"
      self."plone.app.contenttypes"
      self."plone.app.registry"
      self."plone.app.z3cform"
      self."plone.behavior"
      self."plone.dexterity"
      self."z3c.relationfield"
      self."zope.publisher"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Multilingual Plone UI package, enables maintenance of translations for both Dexterity types and Archetypes";
      };
    };



    "plone.app.openid" = python.mkDerivation {
      name = "plone.app.openid-2.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d2/ad/d3a9ab1097817ad33da2aea94b12739aa97917c6d8bf419afc01d2063ec5/plone.app.openid-2.1.1.tar.gz"; sha256 = "ada46026cba1675e47132514571c21b79f68d88e774b3190189db6662d083526"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFPlone"
      self."Products.PlonePAS"
      self."Products.PluggableAuthService"
      self."Zope2"
      self."plone.app.portlets"
      self."plone.openid"
      self."plone.portlets"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Plone OpenID authentication support";
      };
    };



    "plone.app.portlets" = python.mkDerivation {
      name = "plone.app.portlets-3.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7a/b1/964631378392661691f1ba9d491f0befa1a6d764f34faeaae5e22e06b55a/plone.app.portlets-3.1.3.tar.gz"; sha256 = "800cd4d1c820181f43c0ac3b3f2f39eb97ab016d7f19fad6cba80233422cbdac"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.ATContentTypes"
      self."Products.CMFCore"
      self."Products.CMFDynamicViewFTI"
      self."Products.CMFPlone"
      self."Products.GenericSetup"
      self."Products.PluggableAuthService"
      self."ZODB3"
      self."Zope2"
      self."feedparser"
      self."five.customerize"
      self."plone.app.blob"
      self."plone.app.i18n"
      self."plone.app.layout"
      self."plone.app.vocabularies"
      self."plone.i18n"
      self."plone.memoize"
      self."plone.portlets"
      self."transaction"
      self."zope.annotation"
      self."zope.browser"
      self."zope.component"
      self."zope.configuration"
      self."zope.container"
      self."zope.contentprovider"
      self."zope.event"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.publisher"
      self."zope.schema"
      self."zope.site"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Plone integration for the basic plone.portlets package";
      };
    };



    "plone.app.querystring" = python.mkDerivation {
      name = "plone.app.querystring-1.3.15";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/69/fd/ed00a530b58a5c7ac7aab4e04c413cf65891ed9f44aaa4176cd6716c16e1/plone.app.querystring-1.3.15.tar.gz"; sha256 = "d45affe3fc7e55cb143dc71d77657b27cbfd0dc9d118175ee49e9afa9e2b1b96"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."DateTime"
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."plone.app.contentlisting"
      self."plone.app.layout"
      self."plone.app.registry"
      self."plone.app.vocabularies"
      self."plone.batching"
      self."plone.registry"
      self."python-dateutil"
      self."zope.component"
      self."zope.dottedname"
      self."zope.globalrequest"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.publisher"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "A queryparser, querybuilder and extra helper tools, to parse stored queries to actual results, used in new style Plone collections";
      };
    };



    "plone.app.redirector" = python.mkDerivation {
      name = "plone.app.redirector-1.3.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/61/14/febda31231b593b62f832e63ba597a6081c1a178c482f1950cad9e88543b/plone.app.redirector-1.3.2.tar.gz"; sha256 = "c61d816a577565100f0d6c8d0a61b44c87191faac14b3de0e14e700e70e190fd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.app.contenttypes"
      self."plone.memoize"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "redirection tool";
      };
    };



    "plone.app.registry" = python.mkDerivation {
      name = "plone.app.registry-1.3.12";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/62/98/9e341bfa6bb6ef421071e2602b4a63e03e5ea060a51e479cfe00897398a8/plone.app.registry-1.3.12.tar.gz"; sha256 = "aa0a481af772715fc37839edcb94ce56e1d41d40e0d56fd1db014b8e2eb9d0ed"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Products.GenericSetup"
      self."Products.statusmessages"
      self."Zope2"
      self."lxml"
      self."plone.app.z3cform"
      self."plone.autoform"
      self."plone.registry"
      self."plone.supermodel"
      self."zope.component"
      self."zope.dottedname"
      self."zope.i18nmessageid"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Zope 2 and Plone  integration for plone.registry";
      };
    };



    "plone.app.relationfield" = python.mkDerivation {
      name = "plone.app.relationfield-1.3.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/35/ce/aed9ff567e68b5b4b3fce32119ff804e6c3aaa6781b0d5092828da416983/plone.app.relationfield-1.3.3.tar.gz"; sha256 = "7388ad466de3e271f1a1d5023969f6c74c2564c3899dcd9c61a4e14276e6e473"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."five.intid"
      self."plone.app.dexterity"
      self."plone.app.intid"
      self."plone.app.vocabularies"
      self."plone.app.z3cform"
      self."plone.autoform"
      self."plone.rfc822"
      self."plone.schemaeditor"
      self."plone.supermodel"
      self."z3c.form"
      self."z3c.formwidget.query"
      self."z3c.relationfield"
      self."zope.component"
      self."zope.interface"
      self."zope.intid"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Plone support for z3c.relationfield";
      };
    };



    "plone.app.textfield" = python.mkDerivation {
      name = "plone.app.textfield-1.2.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3e/ea/7e209cf05993ffd629c063628ec72a224692fccc99d1cd680f085a7ca84e/plone.app.textfield-1.2.7.tar.gz"; sha256 = "14dff5fd2b501601a3fb21f7e4b3eb4548714b4ad2c5260de06da40c4dae5ab3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.PortalTransforms"
      self."ZODB3"
      self."plone.rfc822"
      self."plone.schemaeditor"
      self."plone.supermodel"
      self."z3c.form"
      self."zope.component"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Text field with MIME type support";
      };
    };



    "plone.app.theming" = python.mkDerivation {
      name = "plone.app.theming-1.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/60/4c/7684b21ad19f15c6d5bb10978930e926046f87f28c4e6815a148c6ebdae6/plone.app.theming-1.3.0.tar.gz"; sha256 = "41eaa3c00919ad29f3ee3922815528b55a5693c822b2068f9dfc693b709735c1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFPlone"
      self."diazo"
      self."docutils"
      self."five.globalrequest"
      self."lxml"
      self."plone.app.registry"
      self."plone.resource"
      self."plone.resourceeditor"
      self."plone.subrequest"
      self."plone.transformchain"
      self."repoze.xmliter"
      self."roman"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Integrates the Diazo theming engine with Plone";
      };
    };



    "plone.app.upgrade" = python.mkDerivation {
      name = "plone.app.upgrade-1.3.27";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d0/e7/7cb23fa45180953f753aa388785f750dc17b2e240c673cdc8a415e3c50a0/plone.app.upgrade-1.3.27.tar.gz"; sha256 = "e96176e2292bfba1777fdf0f805530fa3158b8242bc9be600f2b2f53265259c9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.Archetypes"
      self."Products.CMFCore"
      self."Products.CMFDiffTool"
      self."Products.CMFEditions"
      self."Products.CMFFormController"
      self."Products.CMFPlacefulWorkflow"
      self."Products.CMFPlone"
      self."Products.CMFQuickInstallerTool"
      self."Products.CMFUid"
      self."Products.DCWorkflow"
      self."Products.GenericSetup"
      self."Products.MimetypesRegistry"
      self."Products.PlonePAS"
      self."Products.PluggableAuthService"
      self."Products.PortalTransforms"
      self."Products.ResourceRegistries"
      self."Products.SecureMailHost"
      self."Products.ZCatalog"
      self."Products.contentmigration"
      self."Zope2"
      self."borg.localrole"
      self."five.localsitemanager"
      self."plone.app.folder"
      self."plone.app.i18n"
      self."plone.app.iterate"
      self."plone.app.openid"
      self."plone.app.portlets"
      self."plone.app.redirector"
      self."plone.app.theming"
      self."plone.app.viewletmanager"
      self."plone.contentrules"
      self."plone.portlets"
      self."plone.session"
      self."transaction"
      self."zope.component"
      self."zope.interface"
      self."zope.location"
      self."zope.ramcache"
      self."zope.site"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Upgrade machinery for Plone.";
      };
    };



    "plone.app.users" = python.mkDerivation {
      name = "plone.app.users-2.3.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7e/c9/8b47d344fef099925d6a061f9dfa9a8f3d7f4081a53fbd174dd2f0b43ff2/plone.app.users-2.3.7.tar.gz"; sha256 = "e6816b5b4e4dddbb61c6e1260806995e3fc1bd72579eb28d135c29cd005d9a89"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."AccessControl"
      self."Acquisition"
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Products.MailHost"
      self."Products.PlonePAS"
      self."Products.statusmessages"
      self."ZODB3"
      self."Zope2"
      self."plone.app.controlpanel"
      self."plone.app.layout"
      self."plone.autoform"
      self."plone.formwidget.namedfile"
      self."plone.keyring"
      self."plone.namedfile"
      self."plone.protect"
      self."plone.schema"
      self."plone.uuid"
      self."z3c.form"
      self."zope.component"
      self."zope.event"
      self."zope.interface"
      self."zope.schema"
      self."zope.site"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "A package for all things users and groups related (specific to plone)";
      };
    };



    "plone.app.uuid" = python.mkDerivation {
      name = "plone.app.uuid-1.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d7/a6/66fcdcf94ee3a553b97679e4ff3bb352fc2f13000f2ed1f8c13c0c47dfce/plone.app.uuid-1.1.1.tar.gz"; sha256 = "e28cb19a9906ce0f5afddcf645ce32bc3147a3d7c37f2e5b164bb1b5c5b7461b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.Archetypes"
      self."plone.dexterity"
      self."plone.indexer"
      self."plone.uuid"
      self."zope.interface"
      self."zope.publisher"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Plone integration for the basic plone.uuid package";
      };
    };



    "plone.app.versioningbehavior" = python.mkDerivation {
      name = "plone.app.versioningbehavior-1.2.9";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3f/5d/6875d51ff6b1524a41288e4c9c2eb02a05de095b04edd984908aa7efc11f/plone.app.versioningbehavior-1.2.9.tar.gz"; sha256 = "c220cc8968265be70a0c4b103ee389020cf9b972d475274514012bfb0060ef32"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFDiffTool"
      self."Products.CMFEditions"
      self."Products.CMFPlone"
      self."plone.app.dexterity"
      self."plone.autoform"
      self."plone.dexterity"
      self."plone.namedfile"
      self."plone.rfc822"
      self."zope.container"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Provides a behavior for using CMFEditions with dexterity content types";
      };
    };



    "plone.app.viewletmanager" = python.mkDerivation {
      name = "plone.app.viewletmanager-2.0.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/86/e0/ea8e3d4f438ab21607cc6bad0d4892cb96a92c01db46f4d3e24d3a913789/plone.app.viewletmanager-2.0.10.tar.gz"; sha256 = "d1ff7b938b8f484e2cf8a01518cbc04986adc3a1641df23ee70c3fa744ef30f8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFPlone"
      self."Products.GenericSetup"
      self."ZODB3"
      self."Zope2"
      self."plone.app.vocabularies"
      self."zope.component"
      self."zope.contentprovider"
      self."zope.interface"
      self."zope.publisher"
      self."zope.site"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Configurable viewlet manager";
      };
    };



    "plone.app.vocabularies" = python.mkDerivation {
      name = "plone.app.vocabularies-3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/50/d6/412403a4b96ae3f31545b77ec3502aa68124759ce1b8bd41c938383f1248/plone.app.vocabularies-3.0.tar.gz"; sha256 = "7fb535a4ec386f078eb4b521b2a43d335e9d6b6cdfb0f0b20860bb89de53ff14"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."Zope2"
      self."plone.app.imaging"
      self."plone.app.querystring"
      self."pytz"
      self."zope.browser"
      self."zope.component"
      self."zope.configuration"
      self."zope.formlib"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
      self."zope.site"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Collection of generally useful vocabularies for Plone.";
      };
    };



    "plone.app.widgets" = python.mkDerivation {
      name = "plone.app.widgets-2.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/69/4c/d04a609e84584c01a0d9e3c821522b8fa715c581f92b9e0fa6ab3a9073bd/plone.app.widgets-2.0.6.tar.gz"; sha256 = "e685f0bee437593b2505c928ad7fd059b19d2108d4f7314b946c559a483832bf"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."DateTime"
      self."Products.Archetypes"
      self."Products.CMFPlone"
      self."Products.ResourceRegistries"
      self."archetypes.schemaextender"
      self."five.globalrequest"
      self."plone.app.contenttypes"
      self."plone.app.dexterity"
      self."plone.app.event"
      self."plone.app.vocabularies"
      self."plone.app.z3cform"
      self."pytz"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "better plone widgets";
      };
    };



    "plone.app.workflow" = python.mkDerivation {
      name = "plone.app.workflow-2.2.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/53/6a/e9823728869942cfda00db9c6de85e5ae2f33cd1f06cfafa6023e1b1df56/plone.app.workflow-2.2.6.tar.gz"; sha256 = "267bf51e1c407432de8ca6946cf43eeaf6a5a12988c36858683bf7a9a372dd9f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Products.DCWorkflow"
      self."Products.GenericSetup"
      self."Products.statusmessages"
      self."Zope2"
      self."plone.memoize"
      self."transaction"
      self."zope.component"
      self."zope.dottedname"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.schema"
      self."zope.site"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "workflow and security settings for Plone";
      };
    };



    "plone.app.z3cform" = python.mkDerivation {
      name = "plone.app.z3cform-1.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/94/c6/b083d2f685a4c867802f78e35e4375ec655d00aeaf9e0e7e1522301ed0ef/plone.app.z3cform-1.2.1.tar.gz"; sha256 = "052a477efad1d08ad69072a805a7198e442066fb59613e1e5ea6d1ba3399b1ef"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Zope2"
      self."plone.app.textfield"
      self."plone.app.widgets"
      self."plone.browserlayer"
      self."plone.protect"
      self."plone.z3cform"
      self."z3c.form"
      self."z3c.formwidget.query"
      self."zope.browserpage"
      self."zope.component"
      self."zope.contentprovider"
      self."zope.globalrequest"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.publisher"
      self."zope.schema"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "A collection of widgets, templates and other components for use with z3c.form and Plone";
      };
    };



    "plone.autoform" = python.mkDerivation {
      name = "plone.autoform-1.6.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c3/c3/6634081a1dab3f20977c8ad86aad45417dd8c423d3f6f83e20c7511cba73/plone.autoform-1.6.2.tar.gz"; sha256 = "b104a48a7ee2a7bd5f20839f37518829eeea7603db5377f0901fe6386828f2e6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.supermodel"
      self."plone.z3cform"
      self."z3c.form"
      self."zope.dottedname"
      self."zope.interface"
      self."zope.schema"
      self."zope.security"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl3;
        description = "Tools to construct z3c.form forms";
      };
    };



    "plone.batching" = python.mkDerivation {
      name = "plone.batching-1.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1e/ac/81920c71421b206ae386340c7c444e2e2485373314a20a4123af5febb101/plone.batching-1.1.1.tar.gz"; sha256 = "ee157d8be8483d14ff9d30759928da834d0dd4c6aaa256e533de9b3368635d49"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Batching facilities used in Plone.";
      };
    };



    "plone.behavior" = python.mkDerivation {
      name = "plone.behavior-1.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/32/8b/5b7bff4bbc8ad0a730d3633fa9343bea63689dc058fef61708aab1d2d607/plone.behavior-1.1.2.tar.gz"; sha256 = "136b0decc47b784b683b8c9704191afde824aafc781169e54eac52cc565715cc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.annotation"
      self."zope.component"
      self."zope.configuration"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Infrastructure for maintaining a registry of available behaviors";
      };
    };



    "plone.browserlayer" = python.mkDerivation {
      name = "plone.browserlayer-2.1.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/65/03/c0e53b37ce76da30920b192424ace1cfb471ad3f33988b14622e159cea89/plone.browserlayer-2.1.6.tar.gz"; sha256 = "81a82c4be7ef36b4ed8c9efeb193266e5283bde4f120db37b9163a9464033cf9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Zope2"
      self."zope.component"
      self."zope.interface"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Browser layer management for Zope 2 applications";
      };
    };



    "plone.cachepurging" = python.mkDerivation {
      name = "plone.cachepurging-1.0.12";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/61/38/87d8dd85e08a666450d4e050ee9ab1c1773841cf88e4bac1dc88d161f1b7/plone.cachepurging-1.0.12.tar.gz"; sha256 = "093b79a18c00d1f1e9d321ae5e09a07f1a8ec89c9aa38ac19d5f34a261f023bf"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."five.globalrequest"
      self."plone.registry"
      self."z3c.caching"
      self."zope.annotation"
      self."zope.component"
      self."zope.event"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.schema"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL version 2";
        description = "Cache purging support for Zope 2 applications";
      };
    };



    "plone.caching" = python.mkDerivation {
      name = "plone.caching-1.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3a/cf/81ee94c396d871a9774d5b4e862a4f2cc96533a17c8ad51e189f71cc88fc/plone.caching-1.1.1.tar.gz"; sha256 = "ebde3fa84cdc90edb9e3e53df8248a7f9b4a8f0a111b21718963a34f8589e727"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."five.globalrequest"
      self."plone.registry"
      self."plone.transformchain"
      self."z3c.caching"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Zope 2 integration for z3c.caching";
      };
    };



    "plone.contentrules" = python.mkDerivation {
      name = "plone.contentrules-2.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f1/fe/1b3a2af381330ace618ea961744258266ad2f88a258228be20f45f94f53c/plone.contentrules-2.0.6.tar.gz"; sha256 = "01be35eb3f67b54b82f9301b62e61cde2f658b2a61320c7aa72b98cbbc8b680c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.annotation"
      self."zope.component"
      self."zope.componentvocabulary"
      self."zope.configuration"
      self."zope.container"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.schema"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Plone ContentRules Engine";
      };
    };



    "plone.dexterity" = python.mkDerivation {
      name = "plone.dexterity-2.4.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/46/ba/82d96aa454b3bfef7a7a4a33b5433f4155082454d823944c883fe46d3677/plone.dexterity-2.4.3.tar.gz"; sha256 = "2fe7b69f3326b4dfed418796e722befa4c47059f4b4c9f0783b54ed074724c36"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."DateTime"
      self."Products.CMFCore"
      self."Products.CMFDynamicViewFTI"
      self."Products.statusmessages"
      self."ZODB3"
      self."Zope2"
      self."plone.alterego"
      self."plone.autoform"
      self."plone.behavior"
      self."plone.folder"
      self."plone.memoize"
      self."plone.rfc822"
      self."plone.supermodel"
      self."plone.synchronize"
      self."plone.uuid"
      self."plone.z3cform"
      self."zope.annotation"
      self."zope.browser"
      self."zope.component"
      self."zope.container"
      self."zope.dottedname"
      self."zope.filerepresentation"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.location"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.size"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL version 2";
        description = "Framework for content types as filesystem code and TTW (Zope/CMF/Plone)";
      };
    };



    "plone.event" = python.mkDerivation {
      name = "plone.event-1.3.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0a/bb/ea56bd50c72de5e0d3bc08cbe21cc1a42f2b9ef232062046e7d679fb03d0/plone.event-1.3.1.tar.gz"; sha256 = "5b91ebb02d925978eef37cf1b39b926318b0521f2e39cbf60922f3f3e59a2e66"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."DateTime"
      self."python-dateutil"
      self."pytz"
      self."zope.component"
      self."zope.configuration"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Event and calendaring related tools not bound to Plone";
      };
    };



    "plone.folder" = python.mkDerivation {
      name = "plone.folder-1.0.9";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/12/7e/aef62fe1746f0715b23d321333e50454e5df661fb6f5e54558a27dfc72e4/plone.folder-1.0.9.tar.gz"; sha256 = "14025ef5e420f9a43955ed9ee3a2a2d1451166b9e80cb92a47e9d55d20ace7f2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.BTreeFolder2"
      self."Products.CMFCore"
      self."Products.ZCatalog"
      self."Zope2"
      self."plone.memoize"
      self."zope.annotation"
      self."zope.component"
      self."zope.container"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "BTree-based folder implementation with order support";
      };
    };



    "plone.formwidget.namedfile" = python.mkDerivation {
      name = "plone.formwidget.namedfile-1.0.15";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b5/7f/767887082ea98086f24032e914e68915a8817c4b997ba14706db81cdfdf9/plone.formwidget.namedfile-1.0.15.tar.gz"; sha256 = "58f6ec8cbab396b933f2021a829f8d436d1e226204465bb3b87e20b2f2503b33"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.namedfile"
      self."plone.z3cform"
      self."z3c.form"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Image widget for z3c.form and Plone";
      };
    };



    "plone.formwidget.recurrence" = python.mkDerivation {
      name = "plone.formwidget.recurrence-2.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e3/94/47c1b404c49f3f909dcc9c052ce619a80018e8748a57c2e7496ca31cc22f/plone.formwidget.recurrence-2.1.1.tar.gz"; sha256 = "72fdd4e0fd0e9fccba2d5323586b036398385114581b22931fa54cd9f411080e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.ATContentTypes"
      self."Products.Archetypes"
      self."Products.CMFCore"
      self."Products.CMFPlone"
      self."Products.GenericSetup"
      self."Products.validation"
      self."plone.app.z3cform"
      self."python-dateutil"
      self."z3c.form"
      self."zope.component"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Recurrence widget for Plone";
      };
    };



    "plone.i18n" = python.mkDerivation {
      name = "plone.i18n-3.0.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7e/4b/64994cb99e6c61676e477e5e444c055dac055d0eef4e1b755218250c2d3d/plone.i18n-3.0.5.tar.gz"; sha256 = "7bd8d37ca3cbb6980b697bba7a98e79d36ae988817db03e5d84ffb6b455523bf"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Unidecode"
      self."zope.browserresource"
      self."zope.component"
      self."zope.configuration"
      self."zope.i18n"
      self."zope.interface"
      self."zope.publisher"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Advanced i18n/l10n features";
      };
    };



    "plone.indexer" = python.mkDerivation {
      name = "plone.indexer-1.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c0/7e/5d297081eb6373a142749d5dc506a82cc3ce5d9dc603f737048b2608ac2d/plone.indexer-1.0.4.tar.gz"; sha256 = "56fd1479c4ea4221cb13d0188be1c57817c444690ed9e5931c3f9e0d772c4aea"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Products.ZCatalog"
      self."zope.component"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Hooks to facilitate managing custom index values in Zope 2/CMF applications";
      };
    };



    "plone.intelligenttext" = python.mkDerivation {
      name = "plone.intelligenttext-2.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a7/51/ad14d8e969349e8163e0c7a06e13198963e500321901ab10ec86d3bcb334/plone.intelligenttext-2.1.0.tar.gz"; sha256 = "f6c6d31369def051c933392351ba6fe0e0698f40d2da002f88dbc7e58a1d9a5b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Provides transforms from text/x-web-intelligent to text/html and vice versa.";
      };
    };



    "plone.keyring" = python.mkDerivation {
      name = "plone.keyring-3.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fc/ad/1575d35235722c80b1a330f45c3bf6f95c093e329c7aeee4dc538aa8940d/plone.keyring-3.0.1.tar.gz"; sha256 = "76b0746f356920300141f334bebba4df3c10136052efcd0a4c015d26177c6b95"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.container"
      self."zope.interface"
      self."zope.location"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Manage secrets";
      };
    };



    "plone.locking" = python.mkDerivation {
      name = "plone.locking-2.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fc/97/e1195920df97d46170b2fa6bc3cc02f7921b412f48b28417247b0be20ec3/plone.locking-2.1.2.tar.gz"; sha256 = "656776d57f7a251b9a131b3bfe60e40e0b92b5ecb36c1502a0da2ddf6c929857"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."DateTime"
      self."Products.Archetypes"
      self."Products.CMFCore"
      self."ZODB3"
      self."Zope2"
      self."zope.annotation"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
      self."zope.viewlet"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "webdav locking support";
      };
    };



    "plone.memoize" = python.mkDerivation {
      name = "plone.memoize-1.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3d/75/f25737398ade9891c79395d9dbe1296eac0f1731a29ed26e23508ebf0cf0/plone.memoize-1.2.0.tar.gz"; sha256 = "1cc06c6fb9be02ee03a28d407a14a225c4d19b4e640fda2581e5da460347fdc2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
      self."zope.annotation"
      self."zope.component"
      self."zope.configuration"
      self."zope.interface"
      self."zope.publisher"
      self."zope.ramcache"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Decorators for caching the values of functions and methods";
      };
    };



    "plone.namedfile" = python.mkDerivation {
      name = "plone.namedfile-3.0.9";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/02/1b/9fd5772666e06d94a0d0ee2a4b3dd417cd1040a91e50f88ac33a411cddb4/plone.namedfile-3.0.9.tar.gz"; sha256 = "e00b979017861e6c4948aa6bcc0033fc6b6ad55e3c0d60e674ce9ca766f7dca5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Pillow"
      self."Zope2"
      self."lxml"
      self."plone.rfc822"
      self."plone.scale"
      self."plone.schemaeditor"
      self."plone.supermodel"
      self."zope.app.file"
      self."zope.browserpage"
      self."zope.component"
      self."zope.copy"
      self."zope.security"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "File types and fields for images, files and blob files with filenames";
      };
    };



    "plone.openid" = python.mkDerivation {
      name = "plone.openid-2.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ff/45/3d911eb1aa92afdd9a823856898292dae809c902dc514292eb9d5f84bd2b/plone.openid-2.0.4.zip"; sha256 = "785ab11d2791a694e83a630eccf029ded7642f82334fe6f6a5fbafbbac822612"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Acquisition"
      self."Products.PluggableAuthService"
      self."ZODB3"
      self."Zope2"
      self."python-openid"
      self."transaction"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "OpenID authentication support for PAS";
      };
    };



    "plone.outputfilters" = python.mkDerivation {
      name = "plone.outputfilters-2.1.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/da/cb/f6492dc4dbde581e551e30f10250faf768f123d4036839a308c1e419ce6a/plone.outputfilters-2.1.5.tar.gz"; sha256 = "e11278d3bdee9e17e974eb705ac1959bb70fa6048234be6532f6a473ac668152"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Products.GenericSetup"
      self."Products.MimetypesRegistry"
      self."Products.PortalTransforms"
      self."plone.app.contenttypes"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Transformations applied to HTML in Plone text fields as they are rendered";
      };
    };



    "plone.portlet.collection" = python.mkDerivation {
      name = "plone.portlet.collection-3.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d6/d4/cdea4b92520a61844cf00048eeeda8c7f2e11533ea980b6bf0d84beedc66/plone.portlet.collection-3.1.tar.gz"; sha256 = "91b22c6625b38344b0d430b85eb72ceff1435ddef460f6462152c65d215bb58c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.app.contenttypes"
      self."plone.app.portlets"
      self."plone.app.vocabularies"
      self."plone.memoize"
      self."plone.portlets"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "A portlet that fetches results from a collection";
      };
    };



    "plone.portlet.static" = python.mkDerivation {
      name = "plone.portlet.static-3.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b0/c6/4888f86ef280fbafe8be3d6e67e08ca32b63c1411fb8af36a950ef8e5b08/plone.portlet.static-3.0.2.tar.gz"; sha256 = "7861936a1d10ed40f8cc1dbf95e345a6809329ac5a90f6c23d6816a2c2ae8608"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."plone.app.portlets"
      self."plone.app.textfield"
      self."plone.i18n"
      self."plone.portlets"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "An editable static HTML portlet for Plone.";
      };
    };



    "plone.portlets" = python.mkDerivation {
      name = "plone.portlets-2.2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8b/8d/ffc1a640b83a5acc28f630c6900c137a71ca53c53fd75f0d13e63d394747/plone.portlets-2.2.3.tar.gz"; sha256 = "d5731b0537d5fa98fe6992ddff8209f34d2cc1c08f55a6d2d57b884543cd536c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."plone.memoize"
      self."zope.annotation"
      self."zope.browserpage"
      self."zope.component"
      self."zope.configuration"
      self."zope.container"
      self."zope.contentprovider"
      self."zope.interface"
      self."zope.location"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.site"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "An extension of zope.viewlet to support dynamic portlets";
      };
    };



    "plone.protect" = python.mkDerivation {
      name = "plone.protect-3.0.19";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cf/9d/31be0d5aec6c044cb3f96bf683672073cf7fbeb6a1b91ca9f09aed94bc2b/plone.protect-3.0.19.tar.gz"; sha256 = "0ecb482eac79b4bfd70b454f7a9b82c7cfa67b504a14801373e1b2e5acb000c1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFPlone"
      self."Zope2"
      self."collective.monkeypatcher"
      self."five.globalrequest"
      self."plone.keyring"
      self."plone.transformchain"
      self."repoze.xmliter"
      self."zope.component"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Security for browser forms";
      };
    };



    "plone.registry" = python.mkDerivation {
      name = "plone.registry-1.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/dd/02/ee2512a87741e9d6eba0ba3fdcab03f87efd93b659291d8550f91b6fdc20/plone.registry-1.0.4.tar.gz"; sha256 = "19e1fecedacfa824348ed431e39776c36a2324cfd1e27489948e663503249814"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.component"
      self."zope.dottedname"
      self."zope.event"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Registry for application settings (like debconf/ about:config)";
      };
    };



    "plone.resource" = python.mkDerivation {
      name = "plone.resource-1.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/44/4d/6503bfa7f7638cb51b8fcdea7ce5c65f8a82c5a93921ee200d0d4372977c/plone.resource-1.0.6.tar.gz"; sha256 = "6e3c1d552cbc9c50f9fa4040a5380d1ff2203a7e0b00eff0282513e453188743"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."plone.caching"
      self."python-dateutil"
      self."z3c.caching"
      self."zope.component"
      self."zope.configuration"
      self."zope.filerepresentation"
      self."zope.interface"
      self."zope.publisher"
      self."zope.schema"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Static files for Plone";
      };
    };



    "plone.resourceeditor" = python.mkDerivation {
      name = "plone.resourceeditor-2.0.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/30/dd/1f6268c7dc20afb3642ab9bf39a0a9acd8b3b7b7fc6693bd29d8e190595c/plone.resourceeditor-2.0.5.tar.gz"; sha256 = "921ef891a1f615c62c13bbd8b87e0518c6006cfbafc15983b01133545951e78f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."plone.resource"
      self."zope.component"
      self."zope.interface"
      self."zope.publisher"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "GPL";
        description = "Integrates ACE editor into Plone";
      };
    };



    "plone.rfc822" = python.mkDerivation {
      name = "plone.rfc822-1.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4b/4a/3c795e2e47e34dff42abc3e41261984d89cca605b48d989127e4b2d5dcd7/plone.rfc822-1.1.3.tar.gz"; sha256 = "54211a4855a2edb633c75e25884696c2582ffa160e7adaa6fad38d65821d0ca9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.supermodel"
      self."python-dateutil"
      self."zope.component"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "RFC822 marshalling for zope.schema fields";
      };
    };



    "plone.scale" = python.mkDerivation {
      name = "plone.scale-1.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/15/a8/9b0623202a377141c7ac729dd19371f67f6954d3c99f023b7b938e238db7/plone.scale-1.4.1.tar.gz"; sha256 = "b9a897c977467e44950a398aca6137d16c7473ea05b8b4fefd01aa702069e26a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Persistence"
      self."Pillow"
      self."zope.annotation"
      self."zope.component"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Image scaling";
      };
    };



    "plone.schema" = python.mkDerivation {
      name = "plone.schema-1.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/87/23/7aa4a5f299ca911d967b8896596f6add18447ff08d52f2f0a4aaed21bd31/plone.schema-1.0.0.tar.gz"; sha256 = "5ba714804d069ec090382a9c9e392723cdef2d80bbe5875616dbbcc718dc37a5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.app.z3cform"
      self."z3c.form"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Plone specific extensions and fields for zope schematas";
      };
    };



    "plone.schemaeditor" = python.mkDerivation {
      name = "plone.schemaeditor-2.0.11";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4f/15/ae0fc66e46e2e1010e578d1457c1f22bc555796c9b0f0617131b584082d9/plone.schemaeditor-2.0.11.tar.gz"; sha256 = "781015d657bfccadf553a66c40b07d1de8210d612033d3141fb5c273b75fcf05"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."plone.app.dexterity"
      self."plone.autoform"
      self."plone.z3cform"
      self."z3c.form"
      self."zope.cachedescriptors"
      self."zope.component"
      self."zope.container"
      self."zope.globalrequest"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.publisher"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Provides through-the-web editing of a zope schema/interface.";
      };
    };



    "plone.session" = python.mkDerivation {
      name = "plone.session-3.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/db/d6/8fb77fe3e77d739fbad7a9222c60a697a6b3cdb04bcfbc9c4f01043429b5/plone.session-3.6.0.tar.gz"; sha256 = "4d5bf8dd98537c4177f74a0f008c50a58460674281a6df41384bb7e9db526cd5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.PluggableAuthService"
      self."Zope2"
      self."plone.keyring"
      self."plone.protect"
      self."zope.component"
      self."zope.configuration"
      self."zope.interface"
      self."zope.publisher"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Session based auth tkt authentication for Zope";
      };
    };



    "plone.stringinterp" = python.mkDerivation {
      name = "plone.stringinterp-1.1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/86/53/30263c04a63888b6d106188422611db6846c9aea274e6bfe5702e24a3697/plone.stringinterp-1.1.4.tar.gz"; sha256 = "3fdb73a072a2438e02ce5d6535c0b7e2092ebdc9324a3b2d7a895745582099de"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."zope.i18n"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Adaptable string interpolation";
      };
    };



    "plone.subrequest" = python.mkDerivation {
      name = "plone.subrequest-1.7.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/31/9b/f5b4b2ec5c9e793d003faadbf363ee28539d34dbcd8af0e026fc04da28ec/plone.subrequest-1.7.0.tar.gz"; sha256 = "72332f16c90b501acd946d24ef41249a0a3234e22f5adabc47a8f197c4876404"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.MimetypesRegistry"
      self."five.globalrequest"
      self."five.localsitemanager"
      self."plone.app.blob"
      self."zope.globalrequest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Subrequests for Zope2";
      };
    };



    "plone.supermodel" = python.mkDerivation {
      name = "plone.supermodel-1.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ca/ba/56fc8adfff26bb3957f97eef93cfc994a8c97353116e9f9bb513de20c0fe/plone.supermodel-1.3.0.tar.gz"; sha256 = "5dee33bf931f9ce64cec1051e7290803352a12624c5c1f90afa937bb3e5b7798"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."lxml"
      self."plone.rfc822"
      self."z3c.zcmlhook"
      self."zope.component"
      self."zope.deferredimport"
      self."zope.dottedname"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Serialize Zope schema definitions to and from XML";
      };
    };



    "plone.synchronize" = python.mkDerivation {
      name = "plone.synchronize-1.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/33/24/22903d5811a8cb02d71e9da94e42880381c371897af74dd3b7ab4d56cf8e/plone.synchronize-1.0.1.zip"; sha256 = "370e020130a883a7391b914aa9753a2366cfd72ebb1156d73b12cb8155e98909"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Simple decorators to support synchronized methods";
      };
    };



    "plone.theme" = python.mkDerivation {
      name = "plone.theme-3.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c1/82/be2fc28007a2ad0fa1a1437bb90ab2f5a28c9fa1f0b4040754a433211c34/plone.theme-3.0.0.tar.gz"; sha256 = "5d3fc266153a3df179b9071202f18179d8247993e7241d62f610233e027a15d1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Products.CMFCore"
      self."Zope2"
      self."zope.component"
      self."zope.interface"
      self."zope.publisher"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "Tools for managing themes in CMF and Plone sites";
      };
    };



    "plone.transformchain" = python.mkDerivation {
      name = "plone.transformchain-1.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ae/05/1a0c8ab59ec8be9450d461e0e75131c4b5bc59bd03e8f0642c120a397fe6/plone.transformchain-1.2.0.tar.gz"; sha256 = "8a87bfd54b8d846cd52f7c9ac9c5f64ec6596523a7548eb49e83d171bf6e1bd0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."zope.component"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Hook into repoze.zope2 that allows third party packages to register a sequence of hooks that will be allowed to modify the response before it is returned to the browser";
      };
    };



    "plone.uuid" = python.mkDerivation {
      name = "plone.uuid-1.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/61/67/e5d8f8d5c7737637ffb00df101efba3e0ab18712b06fc66b6e3640f28dd2/plone.uuid-1.0.4.tar.gz"; sha256 = "49771e3386073fac1b2bfd23c5a5f8d8065df2d6676b09a43c7143ed7f366bd4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.browserpage"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.publisher"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "UUIDs for content items";
      };
    };



    "plone.z3cform" = python.mkDerivation {
      name = "plone.z3cform-0.8.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ab/c7/e7c14e16c945c5bb320bd4125a9d49defff37cbee2340aaf3cc962b0fbaa/plone.z3cform-0.8.1.zip"; sha256 = "6a133b13f82668cf866ad87b69f180812bb1b278e706d14111cbb399d5df3487"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Zope2"
      self."lxml"
      self."plone.batching"
      self."z3c.form"
      self."zope.browserpage"
      self."zope.component"
      self."zope.i18n"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "plone.z3cform is a library that allows use of z3c.form with Zope and the CMF.";
      };
    };



    "plonetheme.barceloneta" = python.mkDerivation {
      name = "plonetheme.barceloneta-1.6.21";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ec/20/a4188affc25bd06be6e4e4dd94fb69962e77e32342fbcbed4af8a882fa88/plonetheme.barceloneta-1.6.21.tar.gz"; sha256 = "be5d7522f1bc13ed4d677f4e12d8e88f113a7c5d8cbe123aa9f4682a88f0ae6a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."plone.app.theming"
      self."plone.batching"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl1;
        description = "The default theme for Plone 5.";
      };
    };



    "ply" = python.mkDerivation {
      name = "ply-3.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/40/7d/95a7a67fb4c2205d0cbf89e8fabb7b49b4ed812ffdab45510d124bc2bd7e/ply-3.4.tar.gz"; sha256 = "af435f11b7bdd69da5ffbc3fecb8d70a7073ec952e101764c88720cdefb2546b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Python Lex & Yacc";
      };
    };



    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.4.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b6/ff/5eaa688dd8ce78913f47438f9b40071a560126ac3e95f9b9be27dfe546a7/python-dateutil-2.4.2.tar.gz"; sha256 = "3e95445c1db500a344079a47b171c45ef18f57d188dffdb0e4165c71bea8eb3d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Extensions to the standard Python datetime module";
      };
    };



    "python-gettext" = python.mkDerivation {
      name = "python-gettext-3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/80/a7/a4a5cf3aa9500dbb09b48dae6d4d9581883dd90ae7a84cbb2d3448410114/python-gettext-3.0.zip"; sha256 = "f40540324edc600e33df7aaf840aec7a4021d3b0615830918c231eb1d7163456"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Python Gettext po to mo file compiler.";
      };
    };



    "python-openid" = python.mkDerivation {
      name = "python-openid-2.2.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7b/8a/e94d18c666073280b8c0614b7e38cfaf0b129989e42f4ca713942b862f0a/python-openid-2.2.5.tar.gz"; sha256 = "92c51c3ecec846cbec4aeff11f9ff47303d4a63f93b0e6ac0ec02a091fed70ef"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "License :: OSI Approved :: Apache Software License";
        description = "OpenID support for servers and consumers.";
      };
    };



    "pytz" = python.mkDerivation {
      name = "pytz-2015.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7c/bd/56dd0f51fab06520ee443146a4c7fba603fd6471f143a3942324454a33f1/pytz-2015.7.tar.bz2"; sha256 = "fbd26746772c24cb93c8b97cbdad5cb9e46c86bbdb1b9d8a743ee00e2fb1fc5d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };



    "repoze.xmliter" = python.mkDerivation {
      name = "repoze.xmliter-0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bd/e4/9ce7f507d0b765b12b4407b7ae339c1534b43058f714cc4ae8bd6a7eb403/repoze.xmliter-0.6.zip"; sha256 = "f139a3ac13ec5c47528d0df5ecf2a1e6344976bb6fc22b302ebb981c2d50eadd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."future"
      self."lxml"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "Wrapper for ``lxml`` trees which serializes to string upon iteration.";
      };
    };



    "roman" = python.mkDerivation {
      name = "roman-1.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/da/21/0220fc12040847963101021cc6109a45a66ab271259c345a4cb404950a84/roman-1.4.0.tar.gz"; sha256 = "f7bf0304e2a79279cc06d245b2b7f5a3872cddbaa2932db0cbacc12a77e477ec"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.psfl;
        description = "Integer to Roman numerals converter";
      };
    };



    "six" = python.mkDerivation {
      name = "six-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"; sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };



    "slimit" = python.mkDerivation {
      name = "slimit-0.8.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/61/cf/0d6598b1ceb463a46b75a716fbb23d2d5ccc5738aba8ddceeec3fa59997f/slimit-0.8.1.zip"; sha256 = "f433dcef899f166b207b67d91d3f7344659cb33b8259818f084167244e17720b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ply"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "SlimIt - JavaScript minifier";
      };
    };



    "sourcecodegen" = python.mkDerivation {
      name = "sourcecodegen-0.6.14";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/49/8f/2c3657f3b7dc1377510dfb7b286998c4a78ec25d84073a81c4d97b49b7e7/sourcecodegen-0.6.14.tar.gz"; sha256 = "f71971ed2d1bb188f4ca17e123bd34dca6314287726d19fc1ae5f2f0c0c6c5c3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "BSD-like (http://repoze.org/license.html)";
        description = "A Python source-code generator based on the ``compiler.ast`` abstract syntax tree.";
      };
    };



    "tempstorage" = python.mkDerivation {
      name = "tempstorage-2.12.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/05/db/57768d06fe601210dd375ad15dc93013980cc1e4a3817f1034fd69d5a6ed/tempstorage-2.12.2.zip"; sha256 = "be5810936988f60f190dbc485134256b85f0906220a6a5be9036d94d7ebf57c4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "A RAM-based storage for ZODB";
      };
    };



    "transaction" = python.mkDerivation {
      name = "transaction-1.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/01/95/ef0ffb1d9cd39072dc4c38ddfe181d95de696f0567eb0f862935887fd497/transaction-1.1.1.tar.gz"; sha256 = "3e00f6db97297cd2ff869b3d32109019bf898d925593926d729d546a47660ca9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Transaction management for Python";
      };
    };



    "z3c.autoinclude" = python.mkDerivation {
      name = "z3c.autoinclude-0.3.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/49/2a/49da0fc013ff3c36cc8d5306be805f4bd43278d426e359a4a7f87fe4918f/z3c.autoinclude-0.3.6.tar.gz"; sha256 = "2e4e0ff2ff827642603a4dfffcf376f7869ccd3e66ee25c211115e7866f81e41"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.configuration"
      self."zope.dottedname"
      self."zope.interface"
      self."zope.schema"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ZPL";
        description = "Automatically include ZCML";
      };
    };



    "z3c.caching" = python.mkDerivation {
      name = "z3c.caching-2.0a1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fc/eb/b2e37787e674637f30fa63ca867db2568d75ad8b52c8318b7dafe3d633d0/z3c.caching-2.0a1.tar.gz"; sha256 = "ff75ba246d59227bd5d90f038dded04ac82bad4af43954994c8109d9dfb66931"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.browser"
      self."zope.component"
      self."zope.configuration"
      self."zope.event"
      self."zope.interface"
      self."zope.lifecycleevent"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Caching infrastructure for web apps";
      };
    };



    "z3c.form" = python.mkDerivation {
      name = "z3c.form-3.2.9";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/53/cd/822de17a3ef2d49da5467e3a6377b8b29e336535f551f9a2f81274fd29ff/z3c.form-3.2.9.tar.gz"; sha256 = "28a73c47c271cf53cc7096c970ec662848363d17b164a0be06a0ad57cc796638"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."lxml"
      self."six"
      self."z3c.pt"
      self."zope.browser"
      self."zope.browserpage"
      self."zope.browserresource"
      self."zope.component"
      self."zope.configuration"
      self."zope.container"
      self."zope.contentprovider"
      self."zope.event"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.location"
      self."zope.pagetemplate"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.site"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "An advanced form and widget framework for Zope 3";
      };
    };



    "z3c.formwidget.query" = python.mkDerivation {
      name = "z3c.formwidget.query-0.12";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ab/38/7d93a07b58b50a773d7e360217d90839b061c1c8731f8a4aa20cb5b27e96/z3c.formwidget.query-0.12.tar.gz"; sha256 = "88d7860e8b2c1d6dac7784f5defcb88224c326a953c7c86014c4a28d469cc3ba"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."z3c.form"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "A source query widget for z3c.form.";
      };
    };



    "z3c.objpath" = python.mkDerivation {
      name = "z3c.objpath-1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ca/76/54de70f14b59c88fd83f7fd2ec2029a61673b7241c88ad313eaf4878df99/z3c.objpath-1.1.zip"; sha256 = "ed1017f59e45b03c1c05eb808312da6d999c3d7d08365bd9ef242810415499d6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "ZPL";
        description = "Generate and resolve paths to to objects.";
      };
    };



    "z3c.pt" = python.mkDerivation {
      name = "z3c.pt-3.0.0a1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5a/45/db9c761973f0c665e7ca093f88ff22ce1bc25d4543bb0c93caad1a350949/z3c.pt-3.0.0a1.zip"; sha256 = "c301906491f3bcb997a82d55f2481e048ebad1036fb0c19a3ff5e1f3e3f185cd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Chameleon"
      self."six"
      self."zope.component"
      self."zope.contentprovider"
      self."zope.i18n"
      self."zope.interface"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Fast ZPT engine.";
      };
    };



    "z3c.relationfield" = python.mkDerivation {
      name = "z3c.relationfield-0.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/da/af/c474423d05d7708b65ae195406e58efd850db724f0643f3f7da219208f1d/z3c.relationfield-0.7.zip"; sha256 = "8ae295485deac495ae43a81cc23a0e89e9daa7ad00b9729457e22502960131ff"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."lxml"
      self."z3c.objpath"
      self."zc.relation"
      self."zope.container"
      self."zope.intid"
      self."zope.site"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "A relation field framework for Zope 3.";
      };
    };



    "z3c.zcmlhook" = python.mkDerivation {
      name = "z3c.zcmlhook-1.0b1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c5/da/cab04479eb7c64b52ff197c32bc92fb3b04d11ab1d6f818f68d7431b8524/z3c.zcmlhook-1.0b1.tar.gz"; sha256 = "f0456020738a921d68b488c453e76d7dc8b5e8c890593116854f54dfcd3c1302"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.component"
      self."zope.configuration"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Easily hook into the ZCML processing machinery";
      };
    };



    "zExceptions" = python.mkDerivation {
      name = "zExceptions-2.13.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4b/86/110ab12c402082dc05cd5c121ab26d64a184477c6e3150c77edc0cfc4aef/zExceptions-2.13.0.zip"; sha256 = "66d8393f97dbbaf75f440b358cd88a413892c743866bb0b2468afb6247f9f610"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
      self."zope.publisher"
      self."zope.security"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "zExceptions contains common exceptions used in Zope2.";
      };
    };



    "zLOG" = python.mkDerivation {
      name = "zLOG-2.11.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a2/ac/862d618c393546bc447ef58702cc2c26fd4a729bdcd318ca4f121efa50d2/zLOG-2.11.2.tar.gz"; sha256 = "8fa387501217cda142eaa984a43296a1f33c186ec191805ada02b99e5cbd7a25"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZConfig"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "A general logging facility";
      };
    };



    "zc.lockfile" = python.mkDerivation {
      name = "zc.lockfile-1.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ed/80/412ad00eb5dc988d1b1f2307e70b3b3d9fb6cf1b0ca69fb989c8a06a558b/zc.lockfile-1.0.2.tar.gz"; sha256 = "96bb2aa0438f3e29a31e4702316f832ec1482837daef729a92e28c202d8fba5c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Basic inter-process locks";
      };
    };



    "zc.relation" = python.mkDerivation {
      name = "zc.relation-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bf/31/76b2c1e408136b3e61b5508d254b6ccc26c79b14dc440abe17aae05e3695/zc.relation-1.0.tar.gz"; sha256 = "771ee928bce412f4eaeb6ebebb6dbf12ca2ba9dc4d60ad0a0dae0b608b57cdc5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.interface"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "";
        description = "Index intransitive and transitive n-ary relationships.";
      };
    };



    "zdaemon" = python.mkDerivation {
      name = "zdaemon-2.0.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b6/63/09aba72e15d7eadb329e976b9b911626491093647197de6e098f2d1cd14e/zdaemon-2.0.7.tar.gz"; sha256 = "28a96152a62823052359bac7d01a375029146d31310877408bd0a91624411eb8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZConfig"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Daemon process control library and tools for Unix-based systems";
      };
    };



    "zope.annotation" = python.mkDerivation {
      name = "zope.annotation-3.5.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a1/c4/ac2a311d1f2c21f6652b7e88f809cf2c26aed04244f73b0b87e1d18bd4cc/zope.annotation-3.5.0.tar.gz"; sha256 = "2dd6752083bb2b3e597a14cf8b3ae0b0d59aa0b582d35e94b45d8f1c4bd99071"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.component"
      self."zope.interface"
      self."zope.location"
      self."zope.proxy"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Object annotation mechanism";
      };
    };



    "zope.app.file" = python.mkDerivation {
      name = "zope.app.file-3.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8f/10/1176181e341806fcae1102ef38b010ab8399bb5d8526abe2bf32898e570c/zope.app.file-3.6.1.tar.gz"; sha256 = "aacf0c976846a4368b390ae63aecd3e2eedb6f8d6eb62ec1a07ef101aa9d0c6a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."transaction"
      self."zope.app.publication"
      self."zope.contenttype"
      self."zope.datetime"
      self."zope.dublincore"
      self."zope.event"
      self."zope.exceptions"
      self."zope.filerepresentation"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.publisher"
      self."zope.schema"
      self."zope.site"
      self."zope.size"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "File and Image -- Zope 3 Content Components";
      };
    };



    "zope.app.locales" = python.mkDerivation {
      name = "zope.app.locales-3.6.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/99/85/9272efb4f445ba717cc987be576b4f8962ceb5fcc8fc0570e961666dd00a/zope.app.locales-3.6.2.tar.gz"; sha256 = "45512ff909af9129f4ffd89aafb661e6369208371a2a4550ad4053425247f5cb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.tal"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope locale extraction and management utilities";
      };
    };



    "zope.app.publication" = python.mkDerivation {
      name = "zope.app.publication-3.12.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2e/15/da6cb08d5ef45ee61963c71b5a536db3de37889740db6edb4ca814d2dd17/zope.app.publication-3.12.0.zip"; sha256 = "d90f4e8244b6e62c4c2f5880885ae0115e35a583a693bd12fa8b161f9df70b16"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.annotation"
      self."zope.authentication"
      self."zope.browser"
      self."zope.browserpage"
      self."zope.component"
      self."zope.error"
      self."zope.interface"
      self."zope.location"
      self."zope.publisher"
      self."zope.security"
      self."zope.site"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope publication";
      };
    };



    "zope.authentication" = python.mkDerivation {
      name = "zope.authentication-3.7.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/63/c7/f89d1dc8c9956b9d7f1f4e756ab1feec0de26b1917a65181b0880a66d0d6/zope.authentication-3.7.1.zip"; sha256 = "0d4d5c7c54a7ba7bad641e9fa95ff1e0c67d91d46cb1747d64e2659343951be0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.browser"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
      self."zope.security"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Definition of authentication basics for the Zope Framework";
      };
    };



    "zope.broken" = python.mkDerivation {
      name = "zope.broken-3.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/72/ed/daa253dff16fda4420e3c6bde7e6b2e822bb5cd9869cf9e70dc7164e9a7e/zope.broken-3.6.0.zip"; sha256 = "b9b8776002da4f7b6b12dfcce77eb642ae62b39586dbf60e1d9bdc992c9f2999"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Broken Object Interfaces";
      };
    };



    "zope.browser" = python.mkDerivation {
      name = "zope.browser-1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c0/fe/572a1ad449e12a47c74371cd33335afabe14614852c67ad6b35656cd68ec/zope.browser-1.3.zip"; sha256 = "facdabe7c0bc1c9ffe9a2e1770a2146052042529a0784a5e46cb1cc4b865bfec"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Shared Zope Toolkit browser components";
      };
    };



    "zope.browsermenu" = python.mkDerivation {
      name = "zope.browsermenu-3.9.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e0/cd/c8ec0f3a926a78725d88b8572073765d13748f2e5ad9541848267b8e2ebe/zope.browsermenu-3.9.1.zip"; sha256 = "900aecb2bdbfe0f2aef21892dc8bffa3220c3d5205e8e4c38e54b3f80dae083d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.browser"
      self."zope.component"
      self."zope.configuration"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.pagetemplate"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Browser menu implementation for Zope.";
      };
    };



    "zope.browserpage" = python.mkDerivation {
      name = "zope.browserpage-3.12.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fd/5e/5227dd366a80fd35423c7ac912432aa83ee6113c5d1550f9c81e6a9bbade/zope.browserpage-3.12.2.tar.gz"; sha256 = "b3dadfb837e0568b8be02e563c09665a25fa9054889fbe18e3f7e9fbacf508a3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.browsermenu"
      self."zope.component"
      self."zope.configuration"
      self."zope.interface"
      self."zope.pagetemplate"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "ZCML directives for configuring browser views for Zope.";
      };
    };



    "zope.browserresource" = python.mkDerivation {
      name = "zope.browserresource-3.10.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a8/ef/046788dbb93edd2823780405d913c9ba33b9bd56519fe95132bdaeeaec32/zope.browserresource-3.10.3.zip"; sha256 = "95ca1648ab53b43e9c1d728e075e7fdc4ec3e7533c00cf21b6c28bf43011112f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.component"
      self."zope.configuration"
      self."zope.contenttype"
      self."zope.i18n"
      self."zope.interface"
      self."zope.location"
      self."zope.publisher"
      self."zope.schema"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Browser resources implementation for Zope.";
      };
    };



    "zope.cachedescriptors" = python.mkDerivation {
      name = "zope.cachedescriptors-3.5.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b8/8a/b54eb8dea20aa3b7e55b186f43d50953a514c3e362c06e71d3005be11a5c/zope.cachedescriptors-3.5.1.zip"; sha256 = "6a37062ce6b17029521155d3301a3df2bf05ebd6a8ee0477a031435a4a2af3d0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Method and property caching decorators";
      };
    };



    "zope.component" = python.mkDerivation {
      name = "zope.component-3.9.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f0/c4/960684a757e404fd935ca581221016a7a7e5cd96965bb32348d586039060/zope.component-3.9.5.tar.gz"; sha256 = "7664890ede99d30342f05a14251e0d3e2e264232a30b7310769e22d5a29a989a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.configuration"
      self."zope.event"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.location"
      self."zope.proxy"
      self."zope.security"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Component Architecture";
      };
    };



    "zope.componentvocabulary" = python.mkDerivation {
      name = "zope.componentvocabulary-1.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/91/ed/289e50085cccf60342dca1d747fdbc2eea2b4b5a3cc3fa5843fbb27e88fb/zope.componentvocabulary-1.0.1.tar.gz"; sha256 = "07899d971e97f51be31b49c35b6c2d812cafc8d53ce130e5bd08662d50444829"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
      self."zope.security"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Component vocabularies";
      };
    };



    "zope.configuration" = python.mkDerivation {
      name = "zope.configuration-3.7.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a7/16/32f278e57310fd167926f0297ec0e24fd66cc7e6b04fd1c853e282a07a5e/zope.configuration-3.7.4.zip"; sha256 = "1cb7e757ee282fe25eecaf9bf6a5e8715025bc7c6c4374a996879cd5a24c9249"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Configuration Markup Language (ZCML)";
      };
    };



    "zope.container" = python.mkDerivation {
      name = "zope.container-3.11.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5a/c9/303be404bbc3cb93bb47492238bacb0d020b90d62758f0b1ca9411c97d33/zope.container-3.11.2.tar.gz"; sha256 = "87a6f526e8f4ad34ad2b768b9887b67185d0d993daa428c20452ee044600c7c5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.broken"
      self."zope.component"
      self."zope.configuration"
      self."zope.dottedname"
      self."zope.event"
      self."zope.filerepresentation"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.location"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.size"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Container";
      };
    };



    "zope.contentprovider" = python.mkDerivation {
      name = "zope.contentprovider-3.7.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ec/e1/0e7f0cdf92b5824617732371a1a6a0969f1a53fcfebdc6ae29f48cd2176d/zope.contentprovider-3.7.2.tar.gz"; sha256 = "672fbb3922974b1c23bad605e020c10ff5ca31c44abf45ac9cd08cbbecab3432"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.browserpage"
      self."zope.component"
      self."zope.event"
      self."zope.interface"
      self."zope.location"
      self."zope.publisher"
      self."zope.schema"
      self."zope.tales"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Content Provider Framework for Zope Templates";
      };
    };



    "zope.contenttype" = python.mkDerivation {
      name = "zope.contenttype-3.5.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/43/ab/a26760e188b3d172aee9a23df5e728f35f8d260485452aa8a4d06611d1da/zope.contenttype-3.5.5.zip"; sha256 = "4ccb6f0952ac533a70f11521dbc2df34164fb00ecab746130a625de7cc9b47f7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope contenttype";
      };
    };



    "zope.copy" = python.mkDerivation {
      name = "zope.copy-3.5.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/91/f3/b5d73aef4684868cf1561a365fd6a612a06b1225ab9825fe577ca0dcdcdb/zope.copy-3.5.0.tar.gz"; sha256 = "2e95fa032946898a6e689bc48fa3444b0be1861c11545bf710431d8f9195a7fd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.component"
      self."zope.interface"
      self."zope.location"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Pluggable object copying mechanism";
      };
    };



    "zope.datetime" = python.mkDerivation {
      name = "zope.datetime-3.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/78/73/9dc0ae29ef7caf8a5058eb1c5c2a1592172d99325f81c906627b5f3d6256/zope.datetime-3.4.1.tar.gz"; sha256 = "373b8ed926ba18e2cf17e72011f7cecb0c4c35bbd0ede6cc0426e2e6e9b9c5b2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope datetime";
      };
    };



    "zope.deferredimport" = python.mkDerivation {
      name = "zope.deferredimport-3.5.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b7/c3/e31c4b25b9db8d5b7f0da330082b8e6262749315621c2766097a5da76fb9/zope.deferredimport-3.5.3.tar.gz"; sha256 = "eddece4118a7caf035700b070fed22b04d33c4b8fc2b5fdc9eda77d83cdb4877"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.proxy"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "zope.deferredimport allows you to perform imports names that will only be resolved when used in the code.";
      };
    };



    "zope.deprecation" = python.mkDerivation {
      name = "zope.deprecation-3.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/73/04/af94cc85f00bcbd11d1c3a6667fa6cbfb8325587fc44094511d8b8a9da50/zope.deprecation-3.4.1.tar.gz"; sha256 = "1a4df823ae1cce7222bd7e89ba5ae9b5391d488fdc114353a4178642665acc4c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Deprecation Infrastructure";
      };
    };



    "zope.dottedname" = python.mkDerivation {
      name = "zope.dottedname-3.4.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/92/66/c7a200fa1481b32a73c612f20e911a0646e2a993e4040580d4c320a2493e/zope.dottedname-3.4.6.tar.gz"; sha256 = "331d801d98e539fa6c5d50c3835ecc144c429667f483281505de53fc771e6bf5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Resolver for Python dotted names.";
      };
    };



    "zope.dublincore" = python.mkDerivation {
      name = "zope.dublincore-3.7.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5c/a7/81a6fcdabddd9d18f6a641742987a081f0d8f199ba9cb595f94752ef2ed3/zope.dublincore-3.7.0.tar.gz"; sha256 = "42465c5b31d8710015e84445a85bb5848f17ddc666aca87b179176938d8d41fe"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytz"
      self."zope.annotation"
      self."zope.component"
      self."zope.datetime"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.location"
      self."zope.schema"
      self."zope.security"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Dublin Core implementation";
      };
    };



    "zope.error" = python.mkDerivation {
      name = "zope.error-3.7.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/71/ff/3cee25c2badaf32bba893514538a063b4b712a5a3a22bb417f180ef50dd1/zope.error-3.7.4.tar.gz"; sha256 = "9e22106c88bdf1c7ebafb96eddf7bd2207db8994edde6b1de7e7dafa16cd080e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.exceptions"
      self."zope.interface"
      self."zope.location"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "An error reporting utility for Zope3";
      };
    };



    "zope.event" = python.mkDerivation {
      name = "zope.event-3.5.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ad/73/ace089bcd93f9a4a740cc1a80307e42dac10f5b92e044e470d524caf154f/zope.event-3.5.2.tar.gz"; sha256 = "fe543e107340e4158293928fd2723d3634dd0fc212519c9d0f5d0a8012a79e39"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Very basic event publishing system";
      };
    };



    "zope.exceptions" = python.mkDerivation {
      name = "zope.exceptions-3.6.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/01/03/3f240e293811e547b1adb6e2f3e3ad1412a6a125abaef21a517172e68595/zope.exceptions-3.6.2.tar.gz"; sha256 = "ba8618991341ead4b726bf7b8b9e5bbb47018f29c9923412c272b27e440c6ac5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Exceptions";
      };
    };



    "zope.filerepresentation" = python.mkDerivation {
      name = "zope.filerepresentation-3.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2b/6d/ae0d3523e3ee856c5ecea88be19acf34ae10afb5d47c477188f9ab26384e/zope.filerepresentation-3.6.1.tar.gz"; sha256 = "d775ebba4aff7687e0381f050ebda4e48ce50900c1438f3f7e901220634ed3e0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "File-system Representation Interfaces";
      };
    };



    "zope.formlib" = python.mkDerivation {
      name = "zope.formlib-4.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d3/72/417e1df7122d10c8694a4f67549bba55b74d6ffca3942c737118c890bbe6/zope.formlib-4.0.6.zip"; sha256 = "eccca7a4fa967f4a37570230d6d83faaf3cba5f6a046610848d0b7f10ee625e8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytz"
      self."zope.browser"
      self."zope.browserpage"
      self."zope.component"
      self."zope.configuration"
      self."zope.datetime"
      self."zope.event"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Form generation and validation library for Zope";
      };
    };



    "zope.globalrequest" = python.mkDerivation {
      name = "zope.globalrequest-1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/98/8f/c1071a46c82540d8c47511082e1052ceecf06f309b7f4b2dce8c0aeb3027/zope.globalrequest-1.2.tar.gz"; sha256 = "d79eea413b77dceaa29a602852e5092b62a7035e0e7c0898a7bd9429023598ca"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.configuration"
      self."zope.interface"
      self."zope.publisher"
      self."zope.testbrowser"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Global way of retrieving the currently active request.";
      };
    };



    "zope.i18n" = python.mkDerivation {
      name = "zope.i18n-3.7.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/db/5e/1d77d3b10c69781ca6c316645d7cf189b0e88e85cf8e0e273add0b9f2918/zope.i18n-3.7.4.tar.gz"; sha256 = "ed7f54c2be978d28b62cfebf54a74cf4e785500c33d5c0d396ff662fb9e0747c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."python-gettext"
      self."pytz"
      self."zope.component"
      self."zope.configuration"
      self."zope.i18nmessageid"
      self."zope.schema"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Internationalization Support";
      };
    };



    "zope.i18nmessageid" = python.mkDerivation {
      name = "zope.i18nmessageid-3.5.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1e/cb/3478d8ce7683d359dfdeedba289d05aec1418940136ed32f4c2b4e368793/zope.i18nmessageid-3.5.3.tar.gz"; sha256 = "7f423e40969de31ad9b93e7e0241ff1d9d9e02ff15c3309fa9fa69daedd9c71b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Message Identifiers for internationalization";
      };
    };



    "zope.interface" = python.mkDerivation {
      name = "zope.interface-3.6.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b1/e9/920728241c8cc0b0715fdb25cdc7adcca99c2f85b84597fefa383b7e4b73/zope.interface-3.6.7.zip"; sha256 = "85ac373828528ea18a3388cb9b5227b85fd3c3cc99f9875cf89cfea86134ffdc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Interfaces for Python";
      };
    };



    "zope.intid" = python.mkDerivation {
      name = "zope.intid-3.7.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/08/43/6db1c35955c31547d22e3cbae7cda41eaba19c2ae9e80b1a785c9732d674/zope.intid-3.7.2.zip"; sha256 = "4407b15fba8c332bec899ad70da75fd077c9efff8441aac50c03f0eb5ac1e098"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.component"
      self."zope.container"
      self."zope.event"
      self."zope.interface"
      self."zope.keyreference"
      self."zope.lifecycleevent"
      self."zope.location"
      self."zope.security"
      self."zope.site"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Integer Id Utility";
      };
    };



    "zope.keyreference" = python.mkDerivation {
      name = "zope.keyreference-3.6.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7b/1a/ca9335023253a369cfd3334dfaa43e96e57f1c065d5c4d429f1baa1a830d/zope.keyreference-3.6.4.tar.gz"; sha256 = "8cd20b29e3e9ff5ab78212470d87585358c14f08cdfbd153cfb50bbeba8335fc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.component"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Key References";
      };
    };



    "zope.lifecycleevent" = python.mkDerivation {
      name = "zope.lifecycleevent-3.6.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/69/b0/9ecd00a9aafeff81d2adf72c7f99d8a56c1c6882d3853d897d19b6567f19/zope.lifecycleevent-3.6.2.tar.gz"; sha256 = "cdea5cbf059a8b01ff744b625e78f60b2c4ea0b9fb908407973bcee84b446ec4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.component"
      self."zope.container"
      self."zope.event"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Object life-cycle events";
      };
    };



    "zope.location" = python.mkDerivation {
      name = "zope.location-3.9.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b8/2a/7e46cb02ffafb4dee35ee5e598550013698d43b2aa87ba95b2789328e51d/zope.location-3.9.1.tar.gz"; sha256 = "cec909f57def8005973ebff0deada11d2fc25438da34d691a2417eaca2966116"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.component"
      self."zope.configuration"
      self."zope.interface"
      self."zope.proxy"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Location";
      };
    };



    "zope.pagetemplate" = python.mkDerivation {
      name = "zope.pagetemplate-3.6.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f7/b5/98706cc95df06c8a1f3c93f0319eea56c31f92031413896443d72ef3a8f4/zope.pagetemplate-3.6.3.zip"; sha256 = "0851b1b7b1c873bb567454ca2567075db40b0800ba8637e8e54525747d0aef7f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.component"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.proxy"
      self."zope.security"
      self."zope.tal"
      self."zope.tales"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Page Templates";
      };
    };



    "zope.processlifetime" = python.mkDerivation {
      name = "zope.processlifetime-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/80/dd/e66f1ddd36c8bf14312c3a67d6292ba662712093927c4904ac578b41261f/zope.processlifetime-1.0.tar.gz"; sha256 = "acc3aa2e02bad02e69948a00f92947bb68d6c9d875b32d289cf0832d37050d08"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope process lifetime events";
      };
    };



    "zope.proxy" = python.mkDerivation {
      name = "zope.proxy-3.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/68/24/6cc2a4e89594cf91e5a3641015be884d2c3d8af2ae4b8445939dcc1466b8/zope.proxy-3.6.1.zip"; sha256 = "3d1c8ccd2154e96bda5ef305997fcb2a90f7b79b43f70b85ee3a3287ac708e11"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Generic Transparent Proxies";
      };
    };



    "zope.ptresource" = python.mkDerivation {
      name = "zope.ptresource-3.9.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/dd/34/f39379faab73f2a8330d0413b5b38402b6af8dbe77ed34c2fb6e1289507d/zope.ptresource-3.9.0.tar.gz"; sha256 = "63f72d82e21a816f51af70a813ba9a6f7c7fcd214944e413b387bcb711500116"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.browserresource"
      self."zope.interface"
      self."zope.pagetemplate"
      self."zope.publisher"
      self."zope.security"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Page template resource plugin for zope.browserresource";
      };
    };



    "zope.publisher" = python.mkDerivation {
      name = "zope.publisher-3.12.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/81/44/cdf057b23bd5077323eb095cc9d13dacdee2478a1027346fcefe50909fee/zope.publisher-3.12.6.tar.gz"; sha256 = "d994d8eddfba504841492115032a9a7d86b1713ebc96d0ca16fbc6ee93168ba4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.browser"
      self."zope.component"
      self."zope.configuration"
      self."zope.contenttype"
      self."zope.event"
      self."zope.exceptions"
      self."zope.i18n"
      self."zope.interface"
      self."zope.location"
      self."zope.proxy"
      self."zope.security"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "The Zope publisher publishes Python objects on the web.";
      };
    };



    "zope.ramcache" = python.mkDerivation {
      name = "zope.ramcache-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b8/86/3a8193ca2525a47610cbbb0f1c08dbf7f654898ffcc06816991b50c1b0c0/zope.ramcache-1.0.zip"; sha256 = "60d87dd2bcc287ddd2dc3b1e4a22b450ea76b724bdbf6fa18968b9aace2efd60"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.interface"
      self."zope.location"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope RAM Cache";
      };
    };



    "zope.schema" = python.mkDerivation {
      name = "zope.schema-4.4.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0d/b2/41fdc6c42c4320f326c65810eff785247e65e4ea856cff15120e47b93509/zope.schema-4.4.2.tar.gz"; sha256 = "d32a089d2a774fe67fd19864780e12ebd88d09e89b5c780f6c0795d59b1c24dd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.event"
      self."zope.interface"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "zope.interface extension for defining data schemas";
      };
    };



    "zope.security" = python.mkDerivation {
      name = "zope.security-3.7.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/33/31/cec2173af37cce82968dfefdfc7e69a1c42320054b0b901f5e0bcc0d621b/zope.security-3.7.4.tar.gz"; sha256 = "b645dbca52320270f51343b86339e6c20d0474ea5e1834063bafcc433f8a2810"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."RestrictedPython"
      self."pytz"
      self."zope.component"
      self."zope.configuration"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.location"
      self."zope.proxy"
      self."zope.schema"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Security Framework";
      };
    };



    "zope.sendmail" = python.mkDerivation {
      name = "zope.sendmail-3.7.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/86/7e/a88c12398c13dbddb94345e836753cbc4d8f04a6ebaa65ed791aaf16338b/zope.sendmail-3.7.5.tar.gz"; sha256 = "77ff918ff37d0ca80dcae9739617943f0330e7e3b9519ce0d3097acd80357df5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."transaction"
      self."zope.component"
      self."zope.configuration"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
      self."zope.security"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope sendmail";
      };
    };



    "zope.sequencesort" = python.mkDerivation {
      name = "zope.sequencesort-3.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3f/85/3c36603116b2420509dfe49a942d2086461e580a99f32ce2b94b95987c24/zope.sequencesort-3.4.0.tar.gz"; sha256 = "a77481947d348f02c59c935bc4d390e29fbb4333b39641e6a6262baf53bd9395"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Sequence Sorting";
      };
    };



    "zope.site" = python.mkDerivation {
      name = "zope.site-3.9.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/80/49/e56a008ab36a518e4f89812a3f83aa192cb22d24b005f10a32ed1cc8faa0/zope.site-3.9.2.tar.gz"; sha256 = "95f6c23d1c19511308ebc841a4dda37ef6f1eb5c4d2624db4216d4640013e647"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.annotation"
      self."zope.component"
      self."zope.configuration"
      self."zope.container"
      self."zope.event"
      self."zope.interface"
      self."zope.lifecycleevent"
      self."zope.location"
      self."zope.security"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Local registries for zope component architecture";
      };
    };



    "zope.size" = python.mkDerivation {
      name = "zope.size-3.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b6/5a/763b705b863b1e8c486f13d583c98e3ffeed40bbf650ba795a4ffee251f5/zope.size-3.4.1.tar.gz"; sha256 = "6f1d53becc0dcc10ab9670f61c1086c91a5c0edcfab2afe764cc29d6f1234578"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.i18nmessageid"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Interfaces and simple adapter that give the size of an object";
      };
    };



    "zope.structuredtext" = python.mkDerivation {
      name = "zope.structuredtext-3.5.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/66/75/cc29dadae3d65c7e5012f928d786ec9ea6bbb1abb54f76899d0a6bb1a259/zope.structuredtext-3.5.1.tar.gz"; sha256 = "12b9119ccc737470da73ee777118068db171e77ef9f28e69360905da8b8dbc70"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "StructuredText parser";
      };
    };



    "zope.tal" = python.mkDerivation {
      name = "zope.tal-3.5.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ff/f3/2d99f67be0732cbb49627fcec565890bd9a53bd5fbcea35a75321190e46c/zope.tal-3.5.2.zip"; sha256 = "dab6ed841046382c1fb39c543ffd09cbd152593b7cbdf5a67970b2a805c5feba"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope 3 Template Application Languate (TAL)";
      };
    };



    "zope.tales" = python.mkDerivation {
      name = "zope.tales-3.5.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/12/d4/eb536d79316dc266f3651e10d6e0232100576d3c7e71f90b5f44cd5a052a/zope.tales-3.5.3.tar.gz"; sha256 = "6270f6f87f2b0442a8397dd5a2649c1e85aa65f03f0b1e156b90fbe270601426"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
      self."zope.tal"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Template Application Language Expression Syntax (TALES)";
      };
    };



    "zope.testbrowser" = python.mkDerivation {
      name = "zope.testbrowser-3.11.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/21/96/6cee0b50c06854df241165bb078e146a175f67b9f2c1d33eea563740ea81/zope.testbrowser-3.11.1.tar.gz"; sha256 = "7744def512b47447ef5c17c329537c906243d9c58242d678a2ea370e9f930298"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."mechanize"
      self."pytz"
      self."zope.app.publication"
      self."zope.browserpage"
      self."zope.browserresource"
      self."zope.component"
      self."zope.container"
      self."zope.interface"
      self."zope.ptresource"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.site"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Programmable browser for functional black-box tests";
      };
    };



    "zope.testing" = python.mkDerivation {
      name = "zope.testing-3.9.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cb/ad/92bef28619122440619d8ff1462b3c4fcb028522e4c072a26743394ee26e/zope.testing-3.9.7.tar.gz"; sha256 = "80d6a5327dc382b6a9791c0ed2953f37b67a2c18dcc941a292d678fc07d77364"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.exceptions"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope testing framework, including the testrunner script.";
      };
    };



    "zope.traversing" = python.mkDerivation {
      name = "zope.traversing-3.13.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f9/27/6cccc983aa7479bbfb730ae3410e64d712810d7d58fc971d268c00b0fad0/zope.traversing-3.13.2.zip"; sha256 = "5a340a410ac347f1da56b64e8faeb200c6a21068d301f72ba65131521b5e89c9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ZODB3"
      self."zope.browserpage"
      self."zope.browserresource"
      self."zope.component"
      self."zope.configuration"
      self."zope.container"
      self."zope.i18n"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.location"
      self."zope.pagetemplate"
      self."zope.proxy"
      self."zope.publisher"
      self."zope.security"
      self."zope.site"
      self."zope.tal"
      self."zope.testing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Resolving paths in the object hierarchy";
      };
    };



    "zope.viewlet" = python.mkDerivation {
      name = "zope.viewlet-3.7.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8a/d4/3a466dbe7b7ac67e481b155addfc1ce8534417942b7da2ed7afec1cbcb9f/zope.viewlet-3.7.2.tar.gz"; sha256 = "4fe3d24f9cc7a70f4e774b923df6688538ff2164cde34f74981ed773ef60b2d7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.browserpage"
      self."zope.component"
      self."zope.configuration"
      self."zope.contentprovider"
      self."zope.event"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.location"
      self."zope.publisher"
      self."zope.schema"
      self."zope.security"
      self."zope.size"
      self."zope.testing"
      self."zope.traversing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Viewlets";
      };
    };

  };
  overrides = import ./requirements_override.nix { inherit pkgs python; };

in python.withPackages (fix' (extends overrides generated))