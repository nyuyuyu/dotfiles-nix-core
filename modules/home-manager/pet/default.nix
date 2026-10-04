{ ... }:

{
  # Dependencies
  imports = [
    ../fzf
  ];

  config.programs.pet = {
    enable = true;

    settings.General = {
      backend = "gist";
      cmd = [ ];
      color = false;
      column = 40;
      editor = "vim";
      format = "[$description]: $command $tags";
      selectcmd = "fzf --prompt='Snippets> '";
      sortby = "description";
    };

    snippets = [
      {
        description = "convert pkcs12 to pem";
        command = "openssl pkcs12 -in <P12_FILE=voip_service.p12> -out <PEM_FILE=voip_service.pem> -nodes -clcerts";
      }
      {
        description = "convert unix time to date";
        command = "date -d @<UNIX_TIME> +\"%Y/%m/%d %T\"";
        tag = [ "linux" ];
      }
      {
        description = "convert unix time to date";
        command = "date -r <UNIX_TIME>";
        tag = [ "mac" ];
      }
      {
        description = "delete python cache files/directories";
        command = "find . -type d -name __pycache__ | xargs rm -rf";
      }
      {
        description = "find dead link";
        command = "find <PATH=.> -xtype l";
        tag = [ "linux" ];
      }
      {
        description = "find dead link";
        command = "find -L <PATH=.> -type l";
        tag = [ "mac" ];
      }
      {
        description = "reload gpg-agent";
        command = "gpgconf --reload gpg-agent";
      }
      {
        description = "selectively git checkout";
        command = "git checkout (git branch | grep -v '^*' | tr -d ' ' | fzf)";
        tag = [ "git" ];
      }
      {
        description = "selectively git show from git logs";
        command = "git show (git log --oneline | fzf | awk '{ print $1 }')";
        tag = [ "git" ];
      }
      {
        description = "set kubectl configuration file selectively";
        command = "set -x KUBECONFIG (find -L ~/.kube -type f -name \"config\" -o -name \"*kubeconfig\" | sort | fzf)";
      }
      {
        description = "show a table schema in postgres shell";
        command = "\\d <TABLE_NAME>";
        tag = [ "postgres" "psql" ];
      }
      {
        description = "show access privileges of table in postgres shell";
        command = "\\z info";
        tag = [ "postgres" "psql" ];
      }
      {
        description = "show all databases in postgres shell";
        command = "\\l";
        tag = [ "postgres" "psql" ];
      }
      {
        description = "show all tables in postgres shell";
        command = "\\dt";
        tag = [ "postgres" "psql" ];
      }
      {
        description = "show current unix time";
        command = "date +%s";
      }
      {
        description = "switch database in postgres shell";
        command = "\\c <DATABASE_NAME>";
        tag = [ "postgres" "psql" ];
      }
      {
        description = "unset kubectl configuration file";
        command = "set -x KUBECONFIG ''";
      }
      {
        description = "update pinentry tty";
        command = "gpg-connect-agent updatestartuptty /bye";
      }
    ];
  };
}
