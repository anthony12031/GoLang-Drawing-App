package controllers

import (
	"github.com/astaxie/beego"
)

type WBController struct {
	beego.Controller
}

func (c *WBController) Get() {
	c.TplName = "whiteBoard.tpl"
}
