Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0387D67C850
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 26 Jan 2023 11:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236651AbjAZKSk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 26 Jan 2023 05:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236599AbjAZKSb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 05:18:31 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D23353E54
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:17:58 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id q10so1247923wrm.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6z34fmBFNDBt2+q06vNBZRGJLH/EgsBPP//vb2pYq4c=;
        b=rRW+CtGFsOX+61GmPS24FW99ChsfZ80tH6HR6eJc+EblK9j8e9cSPX36Qg3zfnTPRq
         5u3pupvtJECxDNpdbvD4gzgsuVFsGzSg0eClL7XZ87pEKvvmO+resNATlmC9utytzWYX
         KUY20CsfgqKwuYBbSdOleQ9gdGAx02CniCp+MSOz72ikNxl7E/5aLdwMiC3v2Uif8HLR
         vIX4RpbWVVPQJiz4/yEXFIHozL0RTXcJtaMHagM+4xuMdvFn37IqxlmIBjOkjXUHeNgI
         nGgkZ08rdwkR/TE3J7gOUQNEkgemLd741GPAcofhD0ACgbRI2tGhAGwPJaSaufLM34PE
         rEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6z34fmBFNDBt2+q06vNBZRGJLH/EgsBPP//vb2pYq4c=;
        b=cK86tEZeRiS/I2g0KLNj2R9lk5OENbXQ/H3FMt0cmEytzqotCqbpy+eIzV9Qu9skt0
         Mo9f+z52/6zXmg8zndawd76+xlt334ihox0Ol4kpU3OqQnoM8cOSjfGNP/C9068wGQBH
         awkMaty65ssBHnW/yHjvNoUzD4zN83PPNGh3Jkv7Whh78FU2UTArnVJW/damqa+BQVec
         XnPPuCFPrU+TPuaOeCcJVK3lqJ9O0FzWDhPCjwjQ+usg/PfAezC4AGOAst05sNWZhESg
         bNEl50mN/jqMYL3KG2e8il4ZMEWXrnC2FJwGSFCAZRZ3RC2o7O5PaYmBaEE9e0J1TX4F
         o2UA==
X-Gm-Message-State: AFqh2krcYCVg7nORhed32krj7ZUMeqFbP1Bq1rDsXYap9LwL3Qk3jdaH
        /KsK7tqURS+sTL+OX2dyIklq3n0ZIZXdOjMn
X-Google-Smtp-Source: AMrXdXtc+pqtGjIHD3l9l2nxVr6EYPuHKfoEm+Mg8GpqzGGIwdvCMdY/baBL+vBIpkE0FlDSXTS7bQ==
X-Received: by 2002:adf:c78b:0:b0:2bd:dd13:170f with SMTP id l11-20020adfc78b000000b002bddd13170fmr38484445wrg.26.1674728272547;
        Thu, 26 Jan 2023 02:17:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a17-20020adffb91000000b002bddac15b3dsm868315wrr.33.2023.01.26.02.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 02:17:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        phone-devel@vger.kernel.org, replicant@osuosl.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 7/9] ARM: dts: exynos: use lowercase hex addresses
Date:   Thu, 26 Jan 2023 11:17:45 +0100
Message-Id: <167472826059.11433.13535148546376778683.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125094513.155063-7-krzysztof.kozlowski@linaro.org>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org> <20230125094513.155063-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 25 Jan 2023 10:45:11 +0100, Krzysztof Kozlowski wrote:
> By convention the hex addresses should be lowercase.
> 
> 

Applied, thanks!

[7/9] ARM: dts: exynos: use lowercase hex addresses
      https://git.kernel.org/krzk/linux/c/9ca5a7ce492d182c25ea2e785eeb72cee1d5056b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
