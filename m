Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2DF153F628
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Jun 2022 08:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237023AbiFGGcx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Jun 2022 02:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237017AbiFGGcv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 02:32:51 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67542248EB
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 23:32:49 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o10so21598097edi.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 23:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kUL0/+TW0ZmFocb8yDY5jqKbncdLIBblavQc/eaSQJI=;
        b=sftAmM2OlEfC6VJ8zIEA0Xfsy6v2HTaNTjUKMfYdtxoSdcD3vxrEO/PCEGePaDtozC
         xyHlmLmsdRgR2yk1elTff9tbXqil/B41tk+0WtgEj08Gm/1Kmpx2r/HeUOPzdA0SMfGc
         wFE+ZMwPJFu6CpQ03yhMFxJ04tcjr5hJhfqrLepuc7NPW50CeYYD/ZycxufDQK3A+vuv
         T2ZpVYajmKu/RZ+gY+7+/lh8OekW/q2hi1jds/Xh06lKnW8KXQa4oJEoM09itLbjopST
         PwShn5HcVR8etj+2V8Zl0LAGZJFoRFdvIEiublN0VZCnbQrafYQwBrkLSxB59YhB/GsV
         tuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kUL0/+TW0ZmFocb8yDY5jqKbncdLIBblavQc/eaSQJI=;
        b=RuQM8557Bo1geDbgHeU32evkQ0vuJt0/PzAEKiJAO3Ag4Bxi6b9JjZoDukGrkIiICs
         cmkfJsVxHHZIwATIdQ7hRuxL9IRHbBXBTf8R7ifTZ6yLjl8VRNiJHbDwErxPSaVoVEBa
         mWl486VUKbrGve/Oq0U8bOY26tu5LjI0xEl2HyN/za2O/oUx5dyCNwo++iorkhkOG6h+
         003WcHWKl0Tnhp6UsK4n4lZ8CjREEbTHzFIv8ewWIaGbHVhlPOm89JtJhaiKA//1DEuW
         34U5xcpSnCb7MDp/12zCGnZctq9tMZ6HkA72Eg2LtVYSf5b6DnbCJyo56+R7DwesxcnQ
         oNaw==
X-Gm-Message-State: AOAM532f49SwogNyzU0N24Wl6/rj/MqMDz7GPbyJWVpTgNSmYfACTeX2
        vRd07XN2VhGnh4ViRyAjsm94qznR83MZkA==
X-Google-Smtp-Source: ABdhPJzMq/JTC9wN4RGWyrxYyQtSlviJZtlJ2Wjip2i6n2thkVBo2E+uQfiitHipF1MrM27CgRNrQQ==
X-Received: by 2002:a05:6402:139a:b0:431:6b50:11a2 with SMTP id b26-20020a056402139a00b004316b5011a2mr8272850edv.72.1654583567642;
        Mon, 06 Jun 2022 23:32:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id eg13-20020a056402288d00b0042dce73168csm9796349edb.13.2022.06.06.23.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 23:32:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-mmc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH v2 2/4] arm64: dts: exynos: align MMC node name with dtschema
Date:   Tue,  7 Jun 2022 08:32:41 +0200
Message-Id: <165458355453.6489.3351290853657960731.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605163710.144210-3-krzysztof.kozlowski@linaro.org>
References: <20220605163710.144210-1-krzysztof.kozlowski@linaro.org> <20220605163710.144210-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 5 Jun 2022 18:37:08 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and MMC controller dtschema expects
> "mmc".
> 
> 

Applied, thanks!

[2/4] arm64: dts: exynos: align MMC node name with dtschema
      https://git.kernel.org/krzk/linux/c/2164784a4b2700d1929854b5ec6b2169ff449814

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
