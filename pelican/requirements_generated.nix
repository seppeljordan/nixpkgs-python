# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Jinja2" = python.mkDerivation {
    name = "Jinja2-2.9.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/de/24/bad6dc9f0d7a0f835d940c5f5076f29824fce45ccd673cc843abf30b9117/Jinja2-2.9.2.tar.gz"; sha256 = "2333eae399fb538f934d661f7debab8a9736002c343c8e95c56f1e413076c0ce"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."MarkupSafe"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A small but fast and easy to use stand-alone template engine written in pure python.";
    };
  };



  "MarkupSafe" = python.mkDerivation {
    name = "MarkupSafe-0.23";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz"; sha256 = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Implements a XML/HTML/XHTML Markup safe string for Python";
    };
  };



  "Pygments" = python.mkDerivation {
    name = "Pygments-2.1.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504/Pygments-2.1.3.tar.gz"; sha256 = "88e4c8a91b2af5962bfa5ea2447ec6dd357018e86e94c7d14bd8cacbc5b55d81"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Pygments is a syntax highlighting package written in Python.";
    };
  };



  "Unidecode" = python.mkDerivation {
    name = "Unidecode-0.4.19";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5a/73/053be0fafe387d41ce705585412808093f5a333aaa71cabbab641f677c11/Unidecode-0.04.19.tar.gz"; sha256 = "51477646a9169469e37e791b13ae65fcc75b7f7f570d0d3e514d077805c02e1e"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl2Plus;
      description = "ASCII transliterations of Unicode text";
    };
  };



  "blinker" = python.mkDerivation {
    name = "blinker-1.4";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1b/51/e2a9f3b757eb802f61dc1f2b09c8c99f6eb01cf06416c0671253536517b6/blinker-1.4.tar.gz"; sha256 = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Fast, simple object-to-object and broadcast signaling";
    };
  };



  "docutils" = python.mkDerivation {
    name = "docutils-0.13.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/05/25/7b5484aca5d46915493f1fd4ecb63c38c333bd32aa9ad6e19da8d08895ae/docutils-0.13.1.tar.gz"; sha256 = "718c0f5fb677be0f34b781e04241c4067cbd9327b66bdd8e763201130f5175be"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.publicDomain;
      description = "Docutils -- Python Documentation Utilities";
    };
  };



  "feedgenerator" = python.mkDerivation {
    name = "feedgenerator-1.9";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/eb/02/7069b3dbc6ea92f034e07f9f9adc2193cd02d1aedf2cf9ec71150102a964/feedgenerator-1.9.tar.gz"; sha256 = "5ae05daa9cfa47fa406ee4744d0b7fa1c8a05a7a47ee0ad328ddf55327cfb106"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pytz"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Standalone version of django.utils.feedgenerator";
    };
  };



  "ghp-import" = python.mkDerivation {
    name = "ghp-import-0.5.4";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f5/cd/c780b2248dd364fdc77837a020bad3e176933d7ce5643217d9475465e871/ghp-import-0.5.4.tar.gz"; sha256 = "65d576f107e2a52abdd10866476053a8c2c8ad7e2148a62bc0bc23f501b924cc"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Tumbolia Public License";
      description = "Copy your docs directly to the gh-pages branch.";
    };
  };



  "pelican" = python.mkDerivation {
    name = "pelican-3.7.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9f/4e/371a31c405a47f979f8d46385303214995e99c3f84d8a9a2163e5d19641c/pelican-3.7.0.tar.gz"; sha256 = "0786bcb1a7ab58b3bd81db13175b09a446fe0a1ab8d100252ad844195e9e877b"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Jinja2"
      self."Pygments"
      self."Unidecode"
      self."blinker"
      self."docutils"
      self."feedgenerator"
      self."python-dateutil"
      self."pytz"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.agpl3;
      description = "Static site generator supporting reStructuredText and Markdown source content.";
    };
  };



  "python-dateutil" = python.mkDerivation {
    name = "python-dateutil-2.6.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz"; sha256 = "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"; };
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



  "pytz" = python.mkDerivation {
    name = "pytz-2016.10";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d0/e1/aca6ef73a7bd322a7fc73fd99631ee3454d4fc67dc2bee463e2adf6bb3d3/pytz-2016.10.tar.bz2"; sha256 = "7016b2c4fa075c564b81c37a252a5fccf60d8964aa31b7f5eae59aeb594ae02b"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "World timezone definitions, modern and historical";
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



  "smartypants" = python.mkDerivation {
    name = "smartypants-2.0.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/09/dd/08848ea21422a585ecd2dd32c032fd8f75f0f8345225b455f3bf9e5a0feb/smartypants-2.0.0.tar.gz"; sha256 = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python with the SmartyPants";
    };
  };



  "typogrify" = python.mkDerivation {
    name = "typogrify-2.0.7";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8a/bf/64959d6187d42472acb846bcf462347c9124952c05bd57e5769d5f28f9a6/typogrify-2.0.7.tar.gz"; sha256 = "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."smartypants"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Filters to enhance web typography, including support for Django & Jinja templates";
    };
  };

}