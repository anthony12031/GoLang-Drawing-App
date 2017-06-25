package controllers

import (
	"github.com/astaxie/beego"
)

type WBController struct {
	beego.Controller
}

// @router / [get]
func (c *WBController) Get() {
	c.TplName = "whiteBoard.tpl"
}
