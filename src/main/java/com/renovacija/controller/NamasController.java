package com.renovacija.controller;


import com.renovacija.model.Namas;
import com.renovacija.model.NamasAdd;
import com.renovacija.repository.BankasRep;
import com.renovacija.repository.ButasRep;
import com.renovacija.repository.NamasRep;
import com.renovacija.repository.PalukanuGrazinimoGrafikasRep;
import com.renovacija.service.NamasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;


@Controller
public class NamasController {

    @Autowired
    NamasRep namasRep;

    @Autowired
    ButasRep butasRep;

    @Autowired
    BankasRep bankasRep;

    @Autowired
    NamasService namasService;

    @Autowired
    PalukanuGrazinimoGrafikasRep palukanuGrazinimoGrafikasRep;


    @GetMapping(value = "/")
    public String home() {

        return "index";
    }


//----------------------- Now -------------

    @GetMapping(value = {"/namaslistas"})
    public ModelAndView namasAddListas(@RequestParam (name = "error", required = false) String error, @RequestParam(name = "id", required=false) String namoId, HttpServletRequest request ) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("error", error);
        mav.addObject("bankailist", bankasRep.findAll());
        List<Namas> namas=(List<Namas>) namasService.findAll();
        PagedListHolder pagedListHolder = new PagedListHolder(namas);
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(10);
        mav.addObject("namasadd", pagedListHolder);

        if (namoId != null) {
            if(namoId.equals("new")){
                mav.addObject("modaladd", true);
                mav.addObject("modalupdate", false);
                mav.addObject("namo1", new NamasAdd());
            }else{
            mav.addObject("modalupdate", true);
            mav.addObject("modaladd", false);
            mav.addObject("namo1", new NamasAdd(namasRep.getOne(Integer.parseInt(namoId)), palukanuGrazinimoGrafikasRep.getOne(namasRep.getOne(Integer.parseInt(namoId)).getPalukanuGrazinimoGrafikas().getId())));
            }
        }else{
            mav.addObject("namo1", new NamasAdd());
        }
        mav.setViewName("namaslistas");
        return mav;
    }



    @RequestMapping("/addNamas1")
    public ModelAndView addNam(@Valid @ModelAttribute("namo1") NamasAdd namasAdd, BindingResult bindingResult){
        ModelAndView mv = new ModelAndView();

        if (bindingResult.hasFieldErrors("gatve")){
            mv.addObject("error","Prasome ivesti gatve");
            mv.setViewName("redirect:/namaslistas");
            return mv;
        }
        if (bindingResult.hasFieldErrors("bankas")){
            mv.addObject("error","Prasome pasirinkti banka");
            mv.setViewName("redirect:/namaslistas");
            return mv;
        }

        namasRep.save(namasAdd.getNamas());
        if(namasAdd.getPalukanuGrazinimoGrafikas().getNamas()==null) {
            namasAdd.getPalukanuGrazinimoGrafikas().setNamas(namasAdd.getNamas());
            palukanuGrazinimoGrafikasRep.save(namasAdd.getPalukanuGrazinimoGrafikas());
        }else {

            palukanuGrazinimoGrafikasRep.save(namasAdd.getPalukanuGrazinimoGrafikas());
        }
        mv.setViewName("redirect:/namaslistas");

        return mv;
    }

    @RequestMapping(value = "namasadd/{id}/delete", method = RequestMethod.GET)
    public ModelAndView deleteNamasAdd(@PathVariable("id") Integer id) {
        ModelAndView mv = new ModelAndView();

        try {
            namasRep.delete(namasRep.getOne(id));
            mv.setViewName("redirect:/namaslistas");
            return mv;
        }catch (DataIntegrityViolationException e){
            mv.addObject("error","Namo istrinti negalima, nes jis turi butus!!");
            mv.setViewName("redirect:/namaslistas");
            return mv;
        }

    }



}
