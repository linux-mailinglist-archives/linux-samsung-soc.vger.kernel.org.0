Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA42A55C943
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Jun 2022 14:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbiF0JQM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 27 Jun 2022 05:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233712AbiF0JQL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 05:16:11 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C854389D
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 02:16:10 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id eo8so12106790edb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 02:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1j2L2IcfKUdxDZ6ZLKtNV5PaauRccjj3l8jhcL2l6Q4=;
        b=zVAfnab2UJJUylY2PC7BEyRkDdK180II4QAdeLiBk5DTZC1isuskvsHpzxEyotxxmS
         DL+zyL/AsuaJP42CknJuLJ2jCUGx3GPTPePQP8VpEIRuRRbJq8Wt30ozMExvRUrPspti
         lrma2fpzEQUA/wMSvlKRcl2H00dE/LBz0LCWwkBsuWdfAlNHGBQ9VrV7M6rBGSl4wSDq
         ebhsKy/TaVmz96RWzLEoeiWG7X+ZPl8IpZH+oEQTWBpETm67ze+1j1ywzp4d6u8osGo5
         Ix/deX3wfzNwq7kIQ3piQNl/fMzD7gWD3s4MROydvY9bUr9U9fCgL+iR4n2I276QeSr7
         drGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1j2L2IcfKUdxDZ6ZLKtNV5PaauRccjj3l8jhcL2l6Q4=;
        b=oAjqV9Wds4R9jU+qEnDw1uOXFJUJ0BREGffp3isQmmMWd1Ni4jU/E4SDpoPOBJWM1p
         kwmfwoMMqsc9Harmf8ek+ojZkQUV2t1dVT5SVCeFpMbU8R23NIEFOAdi2KH4LQ0ytWf4
         wT2V3wggRszQNTiEF1m57jXPH9j37OYxSV9VuDI6R+ImcqEreEp3isBQZPvtqbDdsaqd
         cC1dtXfj4GdbIwi67N5/kz/i7j3GbtxAnvgISiZJdukSc8vzloBEVq6AUL+Bttp09Kec
         5XfnOMHHjK5eLym54P5iTjyHIYWVaFXO95eVc3ct/S4tTHvSNMHSpcF/NqpWoMcfrX37
         57eQ==
X-Gm-Message-State: AJIora/WdJ6cJK9AxO89yYLZVZRia2JCYbDfdZWFG3zlV6dQTqgrYkar
        /kawLlzgkbPJIzPgfEAr1fVQ9w==
X-Google-Smtp-Source: AGRyM1vJoCCbZTYDA6MQ+EUkv2LvZ9T2FY7i7QnZGQOzD+0NdcgiVuiRnGsJFo9uC0DXtF+5+wrJPQ==
X-Received: by 2002:aa7:c053:0:b0:437:8ef4:4857 with SMTP id k19-20020aa7c053000000b004378ef44857mr6428672edo.77.1656321368821;
        Mon, 27 Jun 2022 02:16:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        jh80.chung@samsung.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Subject: Re: (subset) [PATCH 3/5] ARM: dts: s3c64xx: align SDHCI node name with dtschema
Date:   Mon, 27 Jun 2022 11:15:44 +0200
Message-Id: <165632135507.81841.6507362158126641884.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626120342.38851-4-krzysztof.kozlowski@linaro.org>
References: <20220626120342.38851-1-krzysztof.kozlowski@linaro.org> <20220626120342.38851-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 26 Jun 2022 14:03:40 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects "mmc".
> 
> 

Applied, thanks!

[3/5] ARM: dts: s3c64xx: align SDHCI node name with dtschema
      https://git.kernel.org/krzk/linux/c/1b90ddb9d942bc75d468758fd2ad632137e733cf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
