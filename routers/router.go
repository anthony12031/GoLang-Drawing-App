package routers

import (
	"whiteBoard/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.HomeController{})
		ns := beego.NewNamespace("/v1",
			beego.NSNamespace("/user",
				beego.NSInclude(
					&controllers.UserController{},
				),
			),
		)
		beego.AddNamespace(ns)
    //beego.Router("/", &controllers.UserController{})
}
