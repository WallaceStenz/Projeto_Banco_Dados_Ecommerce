<img width="300" height="142" alt="modelo-conceitual" src="https://github.com/user-attachments/assets/8a12eadc-8f76-4273-ba75-c5d5b1a0c9e4" />
<svg viewBox="0 0 1900 900" xmlns="http://www.w3.org/2000/svg" font-family="Segoe UI, Arial, sans-serif">
  <rect x="0" y="0" width="1900" height="900" fill="#ffffff"/>

  <!-- ================= LINES (desenhadas primeiro, ficam atrás das caixas) ================= -->
  <g stroke="#2c3e50" stroke-width="2" fill="none">
    <!-- Cliente -> Pedido -->
    <line x1="320" y1="115" x2="620" y2="115"/>
    <!-- Cliente -> triangulo especializacao -->
    <line x1="200" y1="190" x2="200" y2="228"/>
    <!-- triangulo -> PF -->
    <line x1="180" y1="248" x2="140" y2="280"/>
    <!-- triangulo -> PJ -->
    <line x1="220" y1="248" x2="380" y2="280"/>
    <!-- Pedido -> Item_Pedido -->
    <line x1="700" y1="190" x2="960" y2="280"/>
    <!-- Produto -> Item_Pedido -->
    <line x1="1220" y1="170" x2="1080" y2="280"/>
    <!-- Pedido -> Pagamento -->
    <line x1="680" y1="190" x2="640" y2="520"/>
    <!-- Pedido -> Entrega -->
    <line x1="820" y1="190" x2="920" y2="520"/>
  </g>

  <!-- Triangulo de especializacao (d = disjunta, total) -->
  <polygon points="200,228 175,262 225,262" fill="#ffffff" stroke="#2c3e50" stroke-width="2"/>
  <text x="200" y="255" text-anchor="middle" font-size="13" font-weight="bold" fill="#2c3e50">d</text>
  <text x="200" y="212" text-anchor="middle" font-size="12" fill="#555">total</text>

  <!-- ================= LABELS DE RELACIONAMENTO E CARDINALIDADE ================= -->
  <g font-size="13" fill="#2c3e50">
    <text x="470" y="105" text-anchor="middle" font-weight="bold">realiza</text>
    <text x="330" y="108" font-size="12">1</text>
    <text x="605" y="108" font-size="12">N</text>

    <text x="850" y="240" text-anchor="middle" font-weight="bold">contém</text>
    <text x="705" y="215" font-size="12">1</text>
    <text x="945" y="278" font-size="12">N</text>
    <text x="1225" y="200" font-size="12">1</text>
    <text x="1085" y="278" font-size="12">N</text>

    <text x="600" y="360" text-anchor="middle" font-weight="bold" transform="rotate(-58 600 360)">efetua</text>
    <text x="685" y="215" font-size="12">1</text>
    <text x="632" y="505" font-size="12">N</text>

    <text x="900" y="360" text-anchor="middle" font-weight="bold" transform="rotate(58 900 360)">gera</text>
    <text x="828" y="215" font-size="12">1</text>
    <text x="915" y="505" font-size="12">1</text>
  </g>

  <!-- ================= ENTIDADE: CLIENTE ================= -->
  <g>
    <rect x="80" y="40" width="240" height="150" rx="6" fill="#ffffff" stroke="#2c3e50" stroke-width="2"/>
    <rect x="80" y="40" width="240" height="34" rx="6" fill="#2c3e50"/>
    <rect x="80" y="58" width="240" height="16" fill="#2c3e50"/>
    <text x="200" y="63" text-anchor="middle" fill="#ffffff" font-weight="bold" font-size="15">CLIENTE</text>
    <text x="96" y="95" font-size="13" text-decoration="underline" font-weight="bold" fill="#2c3e50">id_cliente (PK)</text>
    <text x="96" y="115" font-size="13" fill="#2c3e50">nome</text>
    <text x="96" y="135" font-size="13" fill="#2c3e50">email</text>
    <text x="96" y="155" font-size="13" fill="#2c3e50">telefone</text>
    <text x="96" y="175" font-size="13" fill="#2c3e50">endereco</text>
  </g>

  <!-- ================= ENTIDADE: PESSOA_FISICA ================= -->
  <g>
    <rect x="40" y="280" width="200" height="100" rx="6" fill="#ffffff" stroke="#2c3e50" stroke-width="2"/>
    <rect x="40" y="280" width="200" height="30" rx="6" fill="#2b6cb0"/>
    <rect x="40" y="296" width="200" height="14" fill="#2b6cb0"/>
    <text x="140" y="300" text-anchor="middle" fill="#ffffff" font-weight="bold" font-size="14">PESSOA_FISICA</text>
    <text x="54" y="330" font-size="12" font-style="italic" fill="#2c3e50">id_cliente (PK, FK)</text>
    <text x="54" y="348" font-size="12" text-decoration="underline" fill="#2c3e50">cpf</text>
    <text x="54" y="366" font-size="12" fill="#2c3e50">data_nascimento</text>
  </g>

  <!-- ================= ENTIDADE: PESSOA_JURIDICA ================= -->
  <g>
    <rect x="280" y="280" width="210" height="100" rx="6" fill="#ffffff" stroke="#2c3e50" stroke-width="2"/>
    <rect x="280" y="280" width="210" height="30" rx="6" fill="#2b6cb0"/>
    <rect x="280" y="296" width="210" height="14" fill="#2b6cb0"/>
    <text x="385" y="300" text-anchor="middle" fill="#ffffff" font-weight="bold" font-size="14">PESSOA_JURIDICA</text>
    <text x="294" y="330" font-size="12" font-style="italic" fill="#2c3e50">id_cliente (PK, FK)</text>
    <text x="294" y="348" font-size="12" text-decoration="underline" fill="#2c3e50">cnpj</text>
    <text x="294" y="366" font-size="12" fill="#2c3e50">razao_social</text>
  </g>

  <!-- ================= ENTIDADE: PEDIDO ================= -->
  <g>
    <rect x="620" y="40" width="240" height="150" rx="6" fill="#ffffff" stroke="#2c3e50" stroke-width="2"/>
    <rect x="620" y="40" width="240" height="34" rx="6" fill="#2c3e50"/>
    <rect x="620" y="58" width="240" height="16" fill="#2c3e50"/>
    <text x="740" y="63" text-anchor="middle" fill="#ffffff" font-weight="bold" font-size="15">PEDIDO</text>
    <text x="636" y="95" font-size="13" text-decoration="underline" font-weight="bold" fill="#2c3e50">id_pedido (PK)</text>
    <text x="636" y="115" font-size="13" font-style="italic" fill="#2c3e50">id_cliente (FK)</text>
    <text x="636" y="135" font-size="13" fill="#2c3e50">data_pedido</text>
    <text x="636" y="155" font-size="13" fill="#2c3e50">status</text>
    <text x="636" y="175" font-size="13" fill="#2c3e50">valor_total</text>
  </g>

  <!-- ================= ENTIDADE: PRODUTO ================= -->
  <g>
    <rect x="1220" y="40" width="220" height="130" rx="6" fill="#ffffff" stroke="#2c3e50" stroke-width="2"/>
    <rect x="1220" y="40" width="220" height="34" rx="6" fill="#2c3e50"/>
    <rect x="1220" y="58" width="220" height="16" fill="#2c3e50"/>
    <text x="1330" y="63" text-anchor="middle" fill="#ffffff" font-weight="bold" font-size="15">PRODUTO</text>
    <text x="1236" y="95" font-size="13" text-decoration="underline" font-weight="bold" fill="#2c3e50">id_produto (PK)</text>
    <text x="1236" y="115" font-size="13" fill="#2c3e50">nome</text>
    <text x="1236" y="135" font-size="13" fill="#2c3e50">preco</text>
    <text x="1236" y="155" font-size="13" fill="#2c3e50">estoque</text>
  </g>

  <!-- ================= ENTIDADE ASSOCIATIVA: ITEM_PEDIDO ================= -->
  <g>
    <rect x="960" y="280" width="240" height="115" rx="6" fill="#ffffff" stroke="#2c3e50" stroke-width="2"/>
    <rect x="960" y="280" width="240" height="30" rx="6" fill="#7c3aed"/>
    <rect x="960" y="296" width="240" height="14" fill="#7c3aed"/>
    <text x="1080" y="300" text-anchor="middle" fill="#ffffff" font-weight="bold" font-size="14">ITEM_PEDIDO</text>
    <text x="974" y="330" font-size="12" font-style="italic" fill="#2c3e50">id_pedido (PK, FK)</text>
    <text x="974" y="348" font-size="12" font-style="italic" fill="#2c3e50">id_produto (PK, FK)</text>
    <text x="974" y="366" font-size="12" fill="#2c3e50">quantidade</text>
    <text x="974" y="384" font-size="12" fill="#2c3e50">preco_unitario</text>
  </g>

  <!-- ================= ENTIDADE: PAGAMENTO ================= -->
  <g>
    <rect x="530" y="520" width="230" height="130" rx="6" fill="#ffffff" stroke="#2c3e50" stroke-width="2"/>
    <rect x="530" y="520" width="230" height="30" rx="6" fill="#c05621"/>
    <rect x="530" y="536" width="230" height="14" fill="#c05621"/>
    <text x="645" y="540" text-anchor="middle" fill="#ffffff" font-weight="bold" font-size="14">PAGAMENTO</text>
    <text x="544" y="570" font-size="12" text-decoration="underline" font-weight="bold" fill="#2c3e50">id_pagamento (PK)</text>
    <text x="544" y="588" font-size="12" font-style="italic" fill="#2c3e50">id_pedido (FK)</text>
    <text x="544" y="606" font-size="12" fill="#2c3e50">tipo (ex.: cartao, pix, boleto)</text>
    <text x="544" y="624" font-size="12" fill="#2c3e50">valor</text>
    <text x="544" y="642" font-size="12" fill="#2c3e50">data_pagamento</text>
  </g>

  <!-- ================= ENTIDADE: ENTREGA ================= -->
  <g>
    <rect x="810" y="520" width="230" height="130" rx="6" fill="#ffffff" stroke="#2c3e50" stroke-width="2"/>
    <rect x="810" y="520" width="230" height="30" rx="6" fill="#2f855a"/>
    <rect x="810" y="536" width="230" height="14" fill="#2f855a"/>
    <text x="925" y="540" text-anchor="middle" fill="#ffffff" font-weight="bold" font-size="14">ENTREGA</text>
    <text x="824" y="570" font-size="12" text-decoration="underline" font-weight="bold" fill="#2c3e50">id_entrega (PK)</text>
    <text x="824" y="588" font-size="12" font-style="italic" fill="#2c3e50">id_pedido (FK)</text>
    <text x="824" y="606" font-size="12" fill="#2c3e50">status</text>
    <text x="824" y="624" font-size="12" fill="#2c3e50">codigo_rastreio</text>
    <text x="824" y="642" font-size="12" fill="#2c3e50">data_envio</text>
  </g>

  <!-- ================= LEGENDA ================= -->
  <g font-size="12" fill="#555">
    <text x="80" y="800">Legenda:</text>
    <text x="80" y="820">PK = chave primaria   |   FK = chave estrangeira   |   triangulo "d/total" = especializacao disjunta e total (Cliente = PF OU PJ, nunca ambos)</text>
    <text x="80" y="840">Item_Pedido resolve o relacionamento N:M entre Pedido e Produto. Pagamento e 1:N a partir de Pedido (mais de uma forma de pagamento por pedido).</text>
    <text x="80" y="860">Entrega e 1:1 com Pedido, contendo status e codigo de rastreio.</text>
  </g>

  <text x="950" y="890" text-anchor="middle" font-size="12" fill="#999">Modelo Conceitual - E-commerce | Desafio de Projeto</text>
</svg>
