package com.renovacija.controller;

import com.renovacija.model.Butas;
import com.renovacija.model.GridSettings;
import com.renovacija.model.Namas;
import com.renovacija.model.Suma;
import com.renovacija.repository.ButasRep;
import com.renovacija.repository.GridSettingsRep;
import com.renovacija.repository.NamasRep;
import com.renovacija.service.ButasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.Instant;
import java.util.Collections;
import java.util.List;

@Controller
public class ButasController {

    @Autowired
    NamasRep namasRep;

    @Autowired
    ButasRep butasRep;

    @Autowired
    ButasService butasService;

    @Autowired
    GridSettingsRep gridSettingsRep;

    @GetMapping(value = {"/butai/{id}"})
    public ModelAndView butuListas(@PathVariable(name = "id") Integer id, @RequestParam(name = "id", required=false) String butoId, HttpServletRequest request  ){
        ModelAndView mav = new ModelAndView();
        Namas namas = namasRep.getOne(id);
        List<Butas> butas=(List<Butas>) butasService.findAllByNamas_IdOrderByButoNrAsc(id);
        PagedListHolder pagedListHolder = new PagedListHolder(butas);
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(10);
        mav.addObject("butolistas", pagedListHolder);


        mav.addObject("namas",namas);
        mav.addObject("grid", gridSettingsRep.getOne(1));
        mav.addObject("suma", new Suma());
        mav.addObject("gridFlat", gridSettingsRep.getOne(1));
        if(butoId!=null ) {
            if(butoId.equals("new")){
                mav.addObject("modaladd",true);
                mav.addObject("modalupdate", false);
                mav.addObject("butas", new Butas());
            }else {
                mav.addObject("modalupdate", true);
                mav.addObject("modaladd",false);
                mav.addObject("butoid", butoId);
                List<Butas> butas1=(List<Butas>) namas.getButas() ;
                PagedListHolder pagedListHolder1 = new PagedListHolder(butas1);
                int page1 = ServletRequestUtils.getIntParameter(request, "p", 0);
                pagedListHolder1.setPage(page1);
                pagedListHolder1.setPageSize(10);
                mav.addObject("butolistas", pagedListHolder);
                mav.addObject("butas", butasRep.getOne(Integer.parseInt(butoId)));
            }
        }else{
            mav.addObject("butas", new Butas());
        }
        mav.setViewName("butulistas");
        return mav;
    }

    @RequestMapping("/settingsGridFlat/{id}")
    public ModelAndView settingsGrid(@Valid @ModelAttribute("gridFlat") GridSettings  gridSettings, BindingResult bindingResult, @PathVariable(name = "id") Integer id) {
        ModelAndView mv = new ModelAndView();

        gridSettingsRep.save(gridSettings);
        mv.setViewName("redirect:/butai/"+id);
        return mv;
    }

    @RequestMapping("/addButas")
    public ModelAndView addButas(@Valid @ModelAttribute("butas") Butas butas, BindingResult bindingResult){
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
        butasRep.save(butas);
        mv.setViewName("redirect:/butai/"+butas.getNamas().getId());

        return mv;
    }

    @RequestMapping(value = "butai/{id}/delete", method = RequestMethod.GET)
    public ModelAndView deleteButas(@PathVariable("id") Integer id)  {
        ModelAndView mv = new ModelAndView();
        int namoidas=butasRep.getOne(id).getNamas().getId();

            butasRep.delete(butasRep.getOne(id));
            mv.setViewName("redirect:/butai/"+namoidas);

        return mv;

    }

    @RequestMapping(value = {"sumapagalplota/{id}"})
    public String butuSumaPagalPlota(@ModelAttribute("suma") Suma suma, @PathVariable("id") Integer id ){

       butasService.butuListasSuPaskirstytaSuma(id,suma.getKreditas(), suma.getPalukanos(), suma.getAtidetosPalukanos());

       return "redirect:/butai/"+id;
    }
}
