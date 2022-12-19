Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E049E650E92
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 19 Dec 2022 16:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbiLSPZw (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 19 Dec 2022 10:25:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbiLSPZw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Dec 2022 10:25:52 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355CE10D3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Dec 2022 07:25:51 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so22350598ejc.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Dec 2022 07:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aj0IM0CjoexC2i+yXzlejMAdGHqKdzeRDWPxbdEC52Y=;
        b=C27vv2XZEEG7o+ka9HbL1o5t/B7aIJ4pAiWnEmugk/R1THnHYJhrpcvb3g+33/nV3m
         FUS4GDIoBadaCouoSTNr3Hni6vlup0jMFlP1BF7zUVsymILYTZS51SdGqdVKmbe7F5gT
         W7H2pkRhunEQFxeFlzT3xhHEuTALwlc5r/S7HFR94VpbgneKm4zMVB0vd1aDVFKvhmAO
         4zZmNa+pabm0UqudM7n1qGo5k96yNSRBzFcLzeHmFUCQev0j5qSTIHkwWNQVJdJdRfin
         DEgPICs36diGa1KlQqxM1wE1Ku7EMgoFDdUzfxbFpnY4FanfMQ4KUPWYAXCWR/mZ2jdD
         JaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj0IM0CjoexC2i+yXzlejMAdGHqKdzeRDWPxbdEC52Y=;
        b=oZdq6iRVsFXZk4nziVWm8RJ/uq4PnI1a20lUcbYkwKyFrYF37cfu1nG9BrqEaPVYxM
         GDYTHnaj4Aibb31L26QK+wu5Nc+TIEAnkuWG+4PZh83hEjeLImNyZ2KPOOrPfEI4FSCv
         Sscxg+arMC5Vfa3nPHtEzP+XhX6DfPuizkmGwp/bn0gnzycaXU9Q668BBVjFehaOwuj1
         igVfBCs3CmpUVKGeMqzwYKiBqYhrsBEoN3iKvqMge2E4W7xLw6li8n2/hjm1KVCQ+6oU
         pVoL7uk+e+IFbRUHBtHLHmHBINtobAh9ckTlRB1CgrlRm7VOpHx72vcC9EpN709ws9tf
         pjww==
X-Gm-Message-State: ANoB5pm+s6wEIDiEUoiSRiIMjGwQHVwilCpa9s5FHPHu594O+h+h2mxi
        ygFFJ1E5+m/d+rP2ciSyIARwmtSIeUF+TOgJGHg=
X-Google-Smtp-Source: AA0mqf6RNAS3BLxNGbG+6VbszxBZsCh5Lwxp+Nx0tJByBwVj3fDL4RyN+tNMFS7BsJ2gpqcowZENPTnJfzVaCuZEevs=
X-Received: by 2002:a17:907:9d04:b0:7c1:1342:61b7 with SMTP id
 kt4-20020a1709079d0400b007c1134261b7mr11287051ejc.524.1671463549653; Mon, 19
 Dec 2022 07:25:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:640c:1d45:b0:183:d190:e1fd with HTTP; Mon, 19 Dec 2022
 07:25:49 -0800 (PST)
Reply-To: sra.xinmeishen@yahoo.com
From:   Xinmei Shen <consultecanadalome@gmail.com>
Date:   Mon, 19 Dec 2022 07:25:49 -0800
Message-ID: <CADOWGUF7q6cuW3oFj0URQVRpuGhbiOWDoNWRYxiddajnSW72BQ@mail.gmail.com>
Subject: Re: Respuesta
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Beneficiario,

Sali=C3=B3 con un premio de las Naciones Unidas afiliado al fondos
monetario internacional en el que se nos entreg=C3=B3 su direcci=C3=B3n de
correo electr=C3=B3nico y el fondos para su transferencia, as=C3=AD que env=
=C3=ADe
sus datos para su transferencia.

Se nos indic=C3=B3 que transfiri=C3=A9ramos todas las transacciones pendien=
tes
dentro de las pr=C3=B3ximas 48 horas o si ya recibi=C3=B3 su fondo, si no l=
o
cumple de inmediato. Nota: Necesitamos su respuesta urgente, este no es
uno de esos estafadores de Internet, es el alivio de COVID-19

Sra. Xinmei Shen
