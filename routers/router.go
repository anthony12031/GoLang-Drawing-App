package routers

import (
	"whiteBoard/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.HomeController{})
    //beego.Router("/whiteboard", &controllers.WBController{})
}
