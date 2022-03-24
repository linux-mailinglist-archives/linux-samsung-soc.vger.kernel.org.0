Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A623D4E6309
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Mar 2022 13:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238780AbiCXMS7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 24 Mar 2022 08:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237496AbiCXMS6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Mar 2022 08:18:58 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E7A99EDF
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Mar 2022 05:17:26 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id j15so8738357eje.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Mar 2022 05:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=VnZAL0nBQUXclvhfgZG2Q/nAtL18/vmGeJE/PdQ+6So=;
        b=Ob8jRwQeUfyIoYck4PfNMJw9L4z9XxFCXrD5baOWRzbikWouZHuuGqBRFXFVFxIYqg
         +MqmiVwu+WEWD1ctFUBgJLyb3NFcZ0C8khC3li0Pu+9/xvekaQqq9e3hmGhSVLriV4WL
         ZVnTuWlKPpNOc+xjLrSMlWuFOz8efE6izae/NkS1fEv5c+8Zdp5vUeuxvgdZsuggqWKL
         b+WzuaZ/fKTSC8AI6mKSN8Pwkfang+JZNRKgLl4KIqPU+q0/9gEEQ1DCgJ6oX9lFG1mU
         Wuqr37Fg04cFpU9cwcUPFwpWTvgl73YHiRTTdGh7QVX+sx7833dTPtNoHd4dJlEGEPj/
         R8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=VnZAL0nBQUXclvhfgZG2Q/nAtL18/vmGeJE/PdQ+6So=;
        b=lwe+rW9TuySfOHpj57EUiKuMvqlTbdoyS3CNljftWARqQqF3lJC7k7zqLGIxMtg7Qk
         MiXjfbtSLJRLjK9lBbHSb90pEFxsFRpq2O/eSOTuzlAZirienp2bwPUHFw8C9r5pCN9N
         A2BI0S44s+TbGwU59h6UXAmTRcfcrzIC+P2fBt3N6+q/3tvyg8q8aphrYM8hyeP9D+z1
         OYO1pQmphoJsPa/4euHowKIrtnhxetFOBQEGxeaF+2pSsr2B+8aUt7XH+o+6zaZQWIz8
         LrS7tDtsnGgv+/+yWkYAVBC13ufg1fMAIVkjGiGKoj+HmwYgOj7W6CFpxmdXPEEdUQ28
         B6Ew==
X-Gm-Message-State: AOAM532xdto7tgnVcyILBGBKLZ0c6EW2i3JCHzGDB6SeOANBh8euDpdp
        7ukwL6aoZNWjahLxRBOhwvk=
X-Google-Smtp-Source: ABdhPJzQ1kV+LiVEklr5+ogd+1XaVO9ZB0kMasLxpamcJLM2mnJ3tJYiPiVEhas8PViykLoa8gyQLw==
X-Received: by 2002:a17:907:3f82:b0:6df:919c:97a with SMTP id hr2-20020a1709073f8200b006df919c097amr5525778ejc.19.1648124245542;
        Thu, 24 Mar 2022 05:17:25 -0700 (PDT)
Received: from [172.20.10.7] ([197.210.47.244])
        by smtp.gmail.com with ESMTPSA id x12-20020aa7d6cc000000b00419812ecd2csm1321149edr.74.2022.03.24.05.17.19
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2022 05:17:25 -0700 (PDT)
Message-ID: <623c6155.1c69fb81.6417.5918@mx.google.com>
From:   Maria Elisabeth Schaeffler <nanpanandrew@gmail.com>
X-Google-Original-From: Maria Elisabeth Schaeffler <info@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Ich bin Frau Maria Elisabeth Schaeffler
To:     Recipients <info@gmail.com>
Date:   Thu, 24 Mar 2022 13:17:12 +0100
Reply-To: mariaelisabethschaeffler51@gmail.com
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, die restlichen 25% dieses Ja=
hr 2022 an Einzelpersonen zu verschenken. Ich habe mich entschieden, 1.500.=
000,00 Euro an Sie zu spenden. Wenn Sie an meiner Spende interessiert sind,=
 kontaktieren Sie mich f=FCr weitere Informationen.

Unter folgendem Link k=F6nnen Sie auch mehr =FCber mich erfahren

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
E-Mail: mariaelisabethschaeffler51@gmail.com
