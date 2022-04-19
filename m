Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27C4A506873
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Apr 2022 12:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348537AbiDSKPQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 19 Apr 2022 06:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350548AbiDSKPP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 06:15:15 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73AC255B1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2022 03:12:32 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 11so15571116edw.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2022 03:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4fzcJSI4oOEyvvnWtTfDgElotLoa5ZRCyODN9ZoDFYc=;
        b=FG2yAAJmlE+e+JJGNL8YIpRAVvDoS5XUHDS3v5TQv4Rpdhr16E7ZVqU+GzX9yQIA5n
         pIRsy6MUX6vZEcwe6QA/1RygGMWK/8PGY4obKR2gvNl7DVSevzthr7FEvcW7q6eXcRU9
         PCjLA5tc+sjbgh0aUwnz5mwZo3UogarS7z0U/sJzjW/xvuwqkrIUuvTOfoXKSJDjERCo
         lunMI6LAuEplt2QvPPEVMlK8UWAZ18wZ/S+ev0mJrX1ghAL2P1AFKl0LwUipaJOe6UeH
         rWCDV6QIV+QMDi6Xc1D4FuHVhDcVhlCQCHDYYKK6DyRC6kfmErIsA5/Twx4TRir4NeF6
         YY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4fzcJSI4oOEyvvnWtTfDgElotLoa5ZRCyODN9ZoDFYc=;
        b=vZKVnIMgcpCrif6TwXuMFTnepRokofQDzgKvxhbQCLfg8ZRB+8RssjLSJtsqWSTQd+
         FqNGfUjJLrTmVpq83OOP/vZMhyRulPvdxRy+k15HDuIQJwQd7IUlpi6EGo3fLfITWj8k
         vaBEBukUUM7sSbddTlgFViv7Xwnp3ki5BC90ZGJRpTz+q7WJYvVYeR5/Tqn//ThXV9aO
         cqEqO5ieN6jVcrN9kxbgumq9kWE/JZ5CKHXTgmgnk1kGW7e45Cz02XqpYrMmeCvWFsbX
         2BCWB9joc9CBR5m+llCz8EW2BXUxRNkFJz5dwOk7ih8XbX3HQlCW9eReLzvWBNs5Cgis
         iL/w==
X-Gm-Message-State: AOAM533Llj9v8s0i1bTbeWsLOd0NMg7DDlXHuqNM1PKWUTSuo/D1INQI
        F7O1IXCcOWRNbmGnQ79eCdursQ==
X-Google-Smtp-Source: ABdhPJwHU6aPLpAzrjz5Zh03plssXITh4QZGe1lmzwZykI8LaTdTDd22ZXc7Gpd2lL1bn4JHn4Wiug==
X-Received: by 2002:aa7:d049:0:b0:41d:8c82:1a61 with SMTP id n9-20020aa7d049000000b0041d8c821a61mr16354944edo.323.1650363151285;
        Tue, 19 Apr 2022 03:12:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v21-20020a1709064e9500b006e8973a14d0sm5581177eju.174.2022.04.19.03.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 03:12:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Stanley Chu <stanley.chu@mediatek.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Jan Kotas <jank@cadence.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>, Li Wei <liwei213@huawei.com>,
        Avri Altman <avri.altman@wdc.com>, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 09/12] arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
Date:   Tue, 19 Apr 2022 12:12:26 +0200
Message-Id: <165036314214.180327.9388318751451146287.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-10-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com> <20220306111125.116455-10-krzysztof.kozlowski@canonical.com>
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

On Sun, 6 Mar 2022 12:11:22 +0100, Krzysztof Kozlowski wrote:
> The DT schema expects 'freq-table-hz' property to be an uint32-matrix,
> which is also easier to read.
> 
> 

Applied, thanks!

[09/12] arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
        commit: 65b96377bf9130617ced41f317f3ec387d3e0dc3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
