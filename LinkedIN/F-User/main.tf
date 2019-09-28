module "linkedin-ad-users" {
  source = "../../Modules/Services/AD_User"
  user_emailids = ["neo@hotmail.onmicrosoft.com","trinity@hotmail.onmicrosoft.com","morpheus@hotmail.onmicrosoft.com"]
  dp_name = ["alpha","bravo","charlie"]
  user_nickname = ["neo","trinity","morpheus"]
  user_pass = ["v$*W2!D4avtBKj9BSKTQcYuD5@$scw9UezK9j#AfLv6XMEyFN5","5Y?FcABUNhn-DV2cHq5Y2sLaHgp?k8_vg=Cht+P$&Q9#=4Jjku",
    "dYXwCtegTS66g%T$kr#t+#sWHK=pQMJHqjE_QcG5Tagt+cWZGd"]
}