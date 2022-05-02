Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD815172B2
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  2 May 2022 17:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385875AbiEBPhP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 2 May 2022 11:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385858AbiEBPhJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 May 2022 11:37:09 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D935FBC89;
        Mon,  2 May 2022 08:33:36 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-d39f741ba0so14585942fac.13;
        Mon, 02 May 2022 08:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=qTLZL7oybviFCeVv3fp6XGSy11bqeUG51xsV7VxmdZY=;
        b=A4nBnE37SvpV/L/AokHuD6q/AOHhFXX2veIBrHCrDIMSYaJwoXFGlHlW98wNLG3Avy
         grcEunyTzMJ7f/MFtE48kihZdP/UpQ4tYzol9uWRUzcUyLqj/jWatnTsSQu0S0kcO5iu
         6a/9Kh4BZp2sYgizXCiaQQ/n1KHbpMLplf7yjWTk5V9n9v+i9MTzpxcRuMqIN0hcHvX/
         r2K60qMf4oYEDAOKIaIgENaIlR3D/wED2mKHdPoTl1gUPhpqWFwjAE9IhoTEhFuAoy86
         Z+cKboOIHB2C9WBbAJtgyTHlogcj8QVvuPGxReCOZ94Md5DKtNVcZ5MWEFqdsPfu0Io7
         QKAQ==
X-Gm-Message-State: AOAM531LqBXrX8WPyznH7dldYDalbC9XIL03GZ776cQvArz3P3Wrzr/h
        AyLQH/StfQk1k6iPxPMu5A==
X-Google-Smtp-Source: ABdhPJwHo5b02MuowtJrHIAf6dPcKifpA2NSwN1T8bByIeErhpqanwqbggluR6kTkM5BKQjzUrUVxA==
X-Received: by 2002:a05:6870:5627:b0:ed:aaf5:dd12 with SMTP id m39-20020a056870562700b000edaaf5dd12mr1936077oao.281.1651505616121;
        Mon, 02 May 2022 08:33:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c63-20020aca3542000000b00325cda1ff96sm2378317oia.21.2022.05.02.08.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 08:33:35 -0700 (PDT)
Received: (nullmailer pid 1161771 invoked by uid 1000);
        Mon, 02 May 2022 15:33:29 -0000
From:   Rob Herring <robh@kernel.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502090230.12853-2-chanho61.park@samsung.com>
References: <20220502090230.12853-1-chanho61.park@samsung.com>        <CGME20220502090100epcas2p4d4c26a79374a6affd1564c2e7287c234@epcas2p4.samsung.com> <20220502090230.12853-2-chanho61.park@samsung.com>
Subject: Re: [PATCH 01/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings
Date:   Mon, 02 May 2022 10:33:29 -0500
Message-Id: <1651505609.463240.1161770.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 02 May 2022 18:02:19 +0900, Chanho Park wrote:
> Add dt-schema for Exynos Auto v9 SoC clock controller.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../clock/samsung,exynosautov9-clock.yaml     | 217 ++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.example.dts:20:18: fatal error: dt-bindings/clock/exynosautov9.h: No such file or directory
   20 |         #include <dt-bindings/clock/exynosautov9.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

