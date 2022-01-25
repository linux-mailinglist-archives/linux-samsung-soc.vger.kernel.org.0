Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4E849B9B7
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 25 Jan 2022 18:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbiAYRIx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 25 Jan 2022 12:08:53 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54546
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239552AbiAYRFe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:05:34 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A7D033F1C6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130332;
        bh=dSvKZ8AHHeBFaUwfnKaz2QA3fzKNbqhnfNH57EfO12U=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=BOz5CwyW9SZaVU0hdxBLIug4WGNw7Zp8QeR7Qed1cjWli1KLDTH62t/hyQwE6s/sR
         Rsz1a5dGdUHm6XTBoIbXiXMtYx8KIGS+w9GjfK4+d6HdKTns5PL+wYQHiIUV+160ZD
         Y5FvpIyeSXwaj+L5kHWhS//bxTz6oW2we95h/jJLBZd5PbSqR9JE/C8GasI4WgqXVX
         R2P3M3dRh86jjyZ8b43N8XyNniIvU+VdFh2B2FZP7JIHnYg3N8N7fRNA0XUWGAgSWM
         UGvfQEKp1Ppo49x8sZLDUu12IN2ftn2aRJYoRXRURSg3W76XwlNlhuxCAVqxd08H/l
         ktDejOOs/RM+g==
Received: by mail-wm1-f72.google.com with SMTP id n19-20020a05600c501300b0034d7b01ae4dso741858wmr.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dSvKZ8AHHeBFaUwfnKaz2QA3fzKNbqhnfNH57EfO12U=;
        b=bSTCqXbq2FRcA7eIsTItTxUp1QUjrhaaQ40oOOwUeCoh87PYN0953A+uIAxh7OtSZs
         SJQ4cRhHgrlzbCG0LXOvsy4cnTRFf79v7l8Pk9BSQtZ4rntnB0Ad6RQ27xgw+ZcZJ1zN
         lCih+L7z1yInSB7Py9gASHCZjMytWHf68uzmre+C5D0dVIzf/k85kkBUmSq46ZCx8pQJ
         moF/mV45AH7ndpYtGJE2kvexqk6+q/1MykVxLagNb3bzakXbJV+WGE1En7xFi/rXzKOE
         IOd2w5ZUZ3toU7vZk4UqiTGqJuq76o1JiZxtd6EMgTbS5hzwsdL3/mSQDs8WNcCOS3Ob
         RvMw==
X-Gm-Message-State: AOAM533n+obIEvsuqNKUXqSFVSlOTGRpHzT3RicJSHaXS4aroG2cmdWd
        Ji5tGGJeUX8U4R3oBpJi+TfdlAAQuNuNnY0EBC8JWif/q0EkKX7xcBRJPLctsdOyhNReo62Soxa
        +AnQch8Fc5kqj+uZxzZOubOZbgKINHeqlq61z89znVgzF/wrI
X-Received: by 2002:a1c:c915:: with SMTP id f21mr3793711wmb.39.1643130332351;
        Tue, 25 Jan 2022 09:05:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7hsKMSTS+c3tg8hbEizs0VHVpl83/TDWW7Ey8qOCr5k/EuXQApytnig+iht+MKtj+BSx35g==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr3793698wmb.39.1643130332208;
        Tue, 25 Jan 2022 09:05:32 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id o15sm1082377wms.9.2022.01.25.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:05:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
        linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] ARM: dts: exynos: drop old thermal properties from Exynos4210
Date:   Tue, 25 Jan 2022 18:04:54 +0100
Message-Id: <164313029072.79782.14492454091056440886.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220122132554.65192-1-krzysztof.kozlowski@canonical.com>
References: <20220122132554.65192-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 22 Jan 2022 14:25:52 +0100, Krzysztof Kozlowski wrote:
> The samsung,tmu_gain and samsung,tmu_reference_voltage properties of
> Exynos Thermal Management Unit driver are not used since April 2018.
> They were removed with commit fccfe0993b5d ("thermal: exynos: remove
> parsing of samsung,tmu_gain property") and commit 61020d189dbc
> ("thermal: exynos: remove parsing of samsung, tmu_reference_voltage
> property"), so drop them also from Exynos4210 DTS.
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: exynos: drop old thermal properties from Exynos4210
      commit: e20bd06fc421fba4099be51d3f56b9b1741b499b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
