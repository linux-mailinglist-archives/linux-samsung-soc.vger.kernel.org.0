Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCAB6ABE67
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  6 Mar 2023 12:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjCFLj1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 6 Mar 2023 06:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbjCFLjW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 06:39:22 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35CEC26864
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 03:39:20 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id k10so13306757edk.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 03:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678102758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/m6Ruj5hwUPG+o/57fmQhrv2GpXodkCIwXsrbUI0kM=;
        b=q/jNnL2jyM+fGwElQZktU4ww9F29epcqZKgT81lva0Ba7/jCWVDIY+BWBk4ve++g8U
         H7S3TeJ+cPysZrLwbXlw+WV4uzHTxrSGZAEHTr/PGz/4n5qZN9/4o+pj5P80nsL0Z32f
         az2PVGndI7lavnJ6wEK9lpOhj95750FuuidsraV1nEw5JlyX20dvrOC4NuoeuKUrYLQw
         2ico8k9t8io8JdcqEQZEU3IAB9bdXRTyXs7EbgAKSjrQAxL5QByPXgq34z5Yx1/slGUQ
         9fGNKWeByy/70zp3Cu8+o4fGM+zAlyimqLWW0by77lMn+8TSSpEHCoK4FexjXHxX0OG2
         ZD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678102758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/m6Ruj5hwUPG+o/57fmQhrv2GpXodkCIwXsrbUI0kM=;
        b=wzniFXHvuI4F+Tmd1ckrY1ZEQ5n4UF1saD9c0F7uen4zIRnLLlWWq8nuhay8F1j8eK
         98xqgUZ/FD+oYH6o4ZlJCabZFMw4+NkrEsjQmgHIA9GA3YcjnzP5v8W2KyC/Wl3qPvBc
         w+qU3DQdExGqggOA0pL3ijN0MtlrMxcLhk5lcww3i959MTQxdMPsOQg8V5UvVjeUF0Qe
         7LyXcKw8d5Lq+ECPLcsSaJ5yfJl6fBzF3zsLPLuojUfHfGFTxcFHwBkKTIJmuoQEhXzj
         Gp+OEG+pRRd1GV5l0WuG2Moe8SEsMDUui74DP9n4LgFkVP8GpHQf3tMAq7En7T2wGyeg
         ZJGw==
X-Gm-Message-State: AO0yUKVUaUBVvQuDZbad32W7+BkTbuSSXaY/jIAG0hOlIF5msLHhd6EZ
        Y4GZhHedB1uaSgRYH4KRoR29vZxttM+MY9+xdkg=
X-Google-Smtp-Source: AK7set8lE7hoo/hOoLv2+iQyvRNs96nlUXnjY5BwmMBCd8+xRARJXE38bFoIaQCj6K1WtZ1UgAEsvg==
X-Received: by 2002:a17:907:742:b0:914:3b00:43ec with SMTP id xc2-20020a170907074200b009143b0043ecmr572939ejb.10.1678102758650;
        Mon, 06 Mar 2023 03:39:18 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id ch10-20020a170906c2ca00b008cf8c6f5c43sm4411936ejb.83.2023.03.06.03.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:39:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH 2/2] ARM: dts: exynos: add ports to TC358764 bridge on Arndale
Date:   Mon,  6 Mar 2023 12:39:07 +0100
Message-Id: <167810274094.82312.13543141865904847311.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225160252.18737-2-krzysztof.kozlowski@linaro.org>
References: <20230225160252.18737-1-krzysztof.kozlowski@linaro.org> <20230225160252.18737-2-krzysztof.kozlowski@linaro.org>
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

On Sat, 25 Feb 2023 17:02:52 +0100, Krzysztof Kozlowski wrote:
> The Toshiba TC358764 bridge binding expect up two ports as it is a
> bridge, thus add ports property to encapsulate them.
> 
> 

Applied, thanks!

[2/2] ARM: dts: exynos: add ports to TC358764 bridge on Arndale
      https://git.kernel.org/krzk/linux/c/704121ff1f6e05bd00ecb1ef2918ac309c18eb45

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
