package controllers

import (
	"github.com/astaxie/beego"
	"fmt"
)

type WBController struct {
	beego.Controller
}

// @router / [get]
func (c *WBController) Get() {
	name := c.GetSession("session")
	fmt.Printf("%+v\n", name)
	if name == nil{
		c.Ctx.Redirect(302,"/")
	}
	c.TplName = "whiteBoard.tpl"
}
