Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12719BF47D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 26 Sep 2019 15:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfIZNyz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 26 Sep 2019 09:54:55 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34793 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfIZNyz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 09:54:55 -0400
Received: by mail-wm1-f68.google.com with SMTP id y135so6682681wmc.1;
        Thu, 26 Sep 2019 06:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5wV+knHWT3pYBu8f1yGbF2JMv7/SsKIGIbzvgHlj+ME=;
        b=Qgboru+Z2okyd6j3StyrhZZhx+KZC4zLUMc2+kGeCoBL7BT6dr0Qos+lAwGaKqfUzt
         Ok1JYHDGSIewhmuKL8aSz8YUKm83IS6ttmSMC4eIYqVy+5OwhSe4+7vb0tRI19N7j6IL
         m4/7vlgmwsVSrYYCABIgteFFmgMjRHtELlwHKPD/fMtcINGlg8aOPpArkzJ56Cf6RJLa
         eohstDzQI5nugM9F/HImtVn6xLIY7JBDaVOjoY9EcDy3aQK0zJB5YuDHgxYXAxDi+IZC
         6e0YJe+jMthTe2iuAtrzqTI+efl+n9RNXwrbcvvhTylfCSRdFi2B4Sm3bcor0XYIjfrF
         yUYw==
X-Gm-Message-State: APjAAAUdebt8myQDTw7gl1psSJKlVVpmezU5HYzCpFEv46jwAHANLagO
        exaWPwWQRu/aQ5kSTono8rg=
X-Google-Smtp-Source: APXvYqxMWSiEBcFYFgkxhkOkbLWb5nMuD3l2ak3ZLUUZEhI7MlrM1L7wlshwHZt+wX2Q+NqzPP5UKg==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr3204892wmh.112.1569506092705;
        Thu, 26 Sep 2019 06:54:52 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id j1sm6011300wrg.24.2019.09.26.06.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 06:54:50 -0700 (PDT)
Date:   Thu, 26 Sep 2019 15:54:47 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Falkowski <m.falkowski@samsung.com>
Subject: Re: [PATCH v2] dt-bindings: sound: Convert Samsung Exynos5433 TM2(E)
 audio complex with WM5110 codec to dt-schema
Message-ID: <20190926135447.GA15983@pi3>
References: <CGME20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4@eucas1p1.samsung.com>
 <20190926120210.8544-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190926120210.8544-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 26, 2019 at 02:02:10PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos5433 TM2(E) audio complex with WM5110 codec to
> newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added type and description and removed number of items from 'model' property.

Thanks for the changes. However still you have non-standard properties
put in random order. Argument that the order follows example-schema is
not correct. These are not standard properties.

Best regards,
Krzysztof

