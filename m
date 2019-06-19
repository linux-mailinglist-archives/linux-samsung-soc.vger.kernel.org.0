Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5D4D4BA32
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Jun 2019 15:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfFSNjd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 19 Jun 2019 09:39:33 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35963 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730891AbfFSNjZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 09:39:25 -0400
Received: by mail-lf1-f66.google.com with SMTP id q26so12177474lfc.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2019 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=poQTjuhtDsupGdVClN0ALov7TDRSULG2jSa2vmjVCU4=;
        b=l0/gF9/OzFgtGmzu7Ddh94ZXY54MyG2jXNCKTSFXAdsBC/fnoN5fG8IjW/eOgNukxP
         Ge373wE/T0YzSFbHLkXp6XkrtHU9mUmwjk7EHw+f2TeVxkgML3d9iDSEvjNajpa+6746
         yQdmuYz36CveVabg5LDbdCLwdMklqodT2SjIvIpGoP+x6PzsZNlG8/lox1bj7i/NL2Ki
         N0gSC8rBoz7T5YInhwaB6YKHfeP5/SMeNjw1NWhrKZXNSem0XOZ/OOLbEFF1/+nnrBFQ
         n3mN0QBoDJo4oGA+e2ID+94wEft9iVNHGoVAxH/PiA6Y39yWM+Mc57ZyDDFsez8ElW+R
         QzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=poQTjuhtDsupGdVClN0ALov7TDRSULG2jSa2vmjVCU4=;
        b=WUN9nwJhtZBq+/k4BW/Q3Gmh4cKk3sSJO9hGYwVEC1N8VCdKIEF5KYKmpzAd34L84o
         BHOjPa2J58em1MBblLww+e+4hKwEDRw+5UWH7xXjC7HXjPa+drDm5pWeCEYRE7dJK92Z
         uajH/mc4nnqKujQHUQvanWegZe/Pk0LaYRTfL1Kzk+Ew7ix/RSwdgKA3j5cDUTznXk7G
         TIMf3x0YKSpPoYZia+xAw/y5zEdlgr2aZt2q08vnh2G1G2/9yXd7ZEYGqVq0yokEP0z+
         epkV01hZX1ZEe72ocLw5ijovdEKZomHa+Ny7yYjiwZU7+c5u0ZyPYJRaWMxNQl7io5t7
         7slQ==
X-Gm-Message-State: APjAAAVlj+NhtgSJ6lyBD7WcM4YkIkv8Nno+v+MXrCS+AipAdmgJj04i
        EsLQT8Uq7pffVIbteAYyhXx4v1H9czHRBg==
X-Google-Smtp-Source: APXvYqxKjnVwguoOB08XOnRxBMmddtcMtOfbSZXzkSUZWCk4zT6Htfabazmn5u6TTmwmpHl9zyBoRA==
X-Received: by 2002:a19:491d:: with SMTP id w29mr45756307lfa.149.1560951563329;
        Wed, 19 Jun 2019 06:39:23 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id n1sm2648220lfl.77.2019.06.19.06.39.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 06:39:22 -0700 (PDT)
Date:   Wed, 19 Jun 2019 06:27:50 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ARM: dts: exynos: Pull for v5.3
Message-ID: <20190619132750.crkv5cvdt2w5jt3h@localhost>
References: <20190616175513.3681-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616175513.3681-1-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Jun 16, 2019 at 07:55:13PM +0200, Krzysztof Kozlowski wrote:
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.3
> 
> for you to fetch changes up to d2cac68e0d9b038da7207c0b63e1399c4f9f60c4:
> 
>   ARM: dts: exynos: Add ADC node to Exynos5410 and Odroid XU (2019-06-11 20:37:21 +0200)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v5.3
> 
> 1. Fixes for minor warnings.
> 2. Enable ADC on Exynos5410 Odroid XU board.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (3):
>       ARM: dts: exynos: Move CPU OPP tables out of SoC node on Exynos5420
>       ARM: dts: exynos: Raise maximum buck regulator voltages on Arndale Octa
>       ARM: dts: exynos: Add ADC node to Exynos5410 and Odroid XU

Merged, thanks!


-Olof
