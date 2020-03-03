package com.renovacija.controller;

import com.renovacija.model.Bankas;
import com.renovacija.model.Butas;
import com.renovacija.model.Namas;
import com.renovacija.repository.BankasRep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.sql.SQLIntegrityConstraintViolationException;

@Controller
public class BankasController {

    @Autowired
    BankasRep bankasRep;

    @GetMapping(value = "/bankulistas")
    public ModelAndView bankuListas(@RequestParam (name = "error", required = false) String error){
        ModelAndView mav = new ModelAndView();
        mav.addObject("error",error);
        mav.addObject("bankulistas", bankasRep.findAll());
        mav.addObject("bankas", new Bankas());
        mav.setViewName("bankulistas");

        return mav;
    }

    @RequestMapping("/addBankas")
    public ModelAndView addBankas(@Valid @ModelAttribute("bankas")Bankas bankas, BindingResult bindingResult){
        ModelAndView mv = new ModelAndView();

//        if (bindingResult.hasFieldErrors("gatve")){
//            mv.addObject("error","Prasome ivesti gatve");
//            mv.setViewName("redirect:/butulistas");
//            return mv;
//        }
//        if (bindingResult.hasFieldErrors("bankas")){
//            mv.addObject("error","Prasome pasirinkti banka");
//            mv.setViewName("redirect:/butulistas");
//            return mv;
//        }
        bankasRep.save(bankas);
        mv.setViewName("redirect:/bankulistas");

        return mv;
    }

    @RequestMapping(value = "bankulistas/{id}/delete", method = RequestMethod.GET)
    public ModelAndView deleteButas(@PathVariable("id") Integer id) {
        ModelAndView mv=new ModelAndView();
        try{
            bankasRep.delete(bankasRep.getOne(id));
            mv.setViewName("redirect:/bankulistas");
            return mv;
        }catch (Exception e){
            mv.addObject("error", "Banko istrinti negalima, nes jis naudojamas name/namuose!!");
            mv.setViewName("redirect:/bankulistas");
            return mv;
        }

    }

}
