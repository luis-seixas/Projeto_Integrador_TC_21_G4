function togglePopup(input, label) {
    
    input.addEventListener("focus", () => {
      label.classList.add("required-popup");
    });
  
    input.addEventListener("blur", () => {
      label.classList.remove("required-popup");
    });
}
  
function inputCorreto(input, helper) {
    helper.classList.remove("visible");
    input.classList.remove("error");
    input.classList.add("correct");
}
  
function inputIncorreto(input, helper) {
    helper.classList.add("visible");
    input.classList.add("error");
    input.classList.remove("correct");
}

//  VALIDAÇÃO NOME  //
let nomeInput = document.getElementById("nome");
let nomeLabel = document.querySelector('label[for="nome"]');
let nomeHelper = document.getElementById("nome-helper");

/*verificar porque o POP UP de campo obrigatorio está aparecendo no alto da página */
/*verificar porque o não está aparecendo a mensagem de erro abaixo do campo */
/*assistir novamente video Joy JavaScript ll Validação de formulário e arquivo aula de 23/05 */

togglePopup(nomeInput, nomeLabel)

nomeInput.addEventListener("change", (e)=> {
    let valor = e.target.value
  
    if(valor.length < 3){
      
      nomeHelper.innerText = "Seu nome precisa ter 3 ou mais caracteres";
        inputIncorreto(nomeInput, nomeHelper)
    } else {
      
        inputCorreto(nomeInput, nomeHelper);
    }
})

// VALIDAÇÃO EMAIL  //
let emailInput = document.getElementById("email");
let emailLabel = document.querySelector('label[for="email"]');
let emailHelper = document.getElementById("email-helper");

togglePopup(emailInput, emailLabel)


emailInput.addEventListener("change", (e)=> {
    let valor = e.target.value
  
    if(valor.includes("@") && valor.includes(".com")){
      
        inputCorreto(emailInput, emailHelper);
    } else {
      
      emailHelper.innerText = "Precisa inserir um email válido";
        inputIncorreto(emailInput, emailHelper);
    }
})


// VALIDAÇÃO TELEFONE  //
let telefoneInput = document.getElementById("telefone");
let telefoneLabel = document.querySelector('label[for="telefone"]');
let telefoneHelper = document.getElementById("telefone-helper");

togglePopup(telefoneInput, telefoneLabel)

telefoneInput.addEventListener("change", (e)=> {
    let valor = e.target.value
  
    if(valor.length < 8){
      
      telefoneHelper.innerText = "Seu telefone precisa ter 8 ou mais numeros";
        inputIncorreto(telefoneInput, telefoneHelper)
    } else {
      
        inputCorreto(telefoneInput, telefoneHelper);
    }
})




