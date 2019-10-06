Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFAC8CD335
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  6 Oct 2019 17:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfJFPvk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 6 Oct 2019 11:51:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52410 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbfJFPvk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Oct 2019 11:51:40 -0400
Received: by mail-wm1-f67.google.com with SMTP id r19so10079236wmh.2;
        Sun, 06 Oct 2019 08:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0nXnEB9b2XWFTb5GFglwkFLq+9bBGBkHzp8HDXQJJYk=;
        b=H17J9Z+nYHEm9yXpdUB+KwmcnS8bD/5iasiJS1bq6WI17f66nITXNhd28BZSwO4KYU
         txjKa7JHkevea/va7qkevnsNurKJJZnn/9CPcXdSPT/zkuWxT0Lo6H8b4ELUdVZhVBvt
         XV2OEIAU8f2pSUs/ij4uM47GY+7i4ocVq9XqOAi+J/xPFms+QpNBag1Po89eEhgyMXqI
         ZiCc+EMtAKSUhDhKCN9erBF+IHNNKLheAkLHVp0UVZhVq+hdg53U+AVxI7KdiVhOgjYg
         oSbXgLBN8vi1FVCexcOanDZMinsoH6nFVWOjNQ/RKkknLp21cL1L033hE7VKdP6P/Jxs
         VSSw==
X-Gm-Message-State: APjAAAUw1ULy2D/Iysuw1PEXvPvCEs+vsdMykI02iOedZkjFag4sXzNM
        67mnW9RPqaUIHz6tufQWI0A=
X-Google-Smtp-Source: APXvYqwMPG0oNHL5qqKUMGxfKA4MAEB/fhmshV+PJLM+ItEC8trmEp5NVxLkaqXJHGbyUjOCdc3wAw==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr17619692wmh.105.1570377096921;
        Sun, 06 Oct 2019 08:51:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id q10sm35989747wrd.39.2019.10.06.08.51.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Oct 2019 08:51:36 -0700 (PDT)
Date:   Sun, 6 Oct 2019 17:51:34 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     kgene@kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com
Subject: Re: [PATCH] soc: samsung: chipid: Make exynos_chipid_early_init()
 static
Message-ID: <20191006155134.GD29365@kozik-lap>
References: <CGME20190904085001eucas1p2b3a120d6206983d47f0084b872042342@eucas1p2.samsung.com>
 <20190904084951.28971-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190904084951.28971-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 04, 2019 at 10:49:51AM +0200, Sylwester Nawrocki wrote:
> Add missing static qualifier to the chipid initcall function.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 2 +-

Thanks, applied.

Best regards,
Krzysztof

