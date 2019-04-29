Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71D85DC43
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Apr 2019 08:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfD2GzY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 29 Apr 2019 02:55:24 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40076 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfD2GzX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 02:55:23 -0400
Received: by mail-lj1-f196.google.com with SMTP id t10so7258249ljg.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Apr 2019 23:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z8D8MI3gegViugIwpZ2280JffkSqWg4ZFxzK/9RxXBo=;
        b=LUbBeObv/gR4XZfXo7oDu/YHe62TWZjhYvw4+JtLknzqp2Lp8hRkwlrRsrhl7Sl1C/
         q2RDtVC14PQvbgr5MBU56llQED/puyU0vk8UPj58UHtIuwGdkA7TUhIptVv4qZz8S0Pl
         Nl2D5I+nmEdXNhleozyao19ZDG4Lj9x7T1UTKK38d3kxAk+3xgQjP+MSiQUHyx1STE7X
         hZuGjAEd5UQenzMBve5zZbPdf8KldseCYP1ojLUexW+6JGKazgTLbD2hNWaBpxOo2bK6
         CM6qPU3HIAWihf7fQxKGPC5kmgfYMGJG8EG2y2rozPNAWijgrVZ5e8RHRlD2SZDnUe2S
         352g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z8D8MI3gegViugIwpZ2280JffkSqWg4ZFxzK/9RxXBo=;
        b=By3XXvsV32jZ/tq9pTU3Zmj3LjGNXtD2qze5ZLIes41YjxI5FCsTkJtQfjtGBiC/bA
         ezrGKOujaTJdqHYdGLANLcsYPE8N8E/1rbA44M+H8KIUkOFq0QTfgJ5z0N037LThgqXo
         sQ5Lc6K4s0IMJn7xVqcPy6bQuZcaPplhIY6uxqXt0A1dgdCN7Qc2o/fo/Xu9aNVfhSvC
         am6IK7hkGKBKLWNe0oXmMXdTjStZDBJm61D7mIPsLQ3XGu+ymU5ks2r10YtS/EWuyP8n
         o/9PEaJxfZZmR5voJ7mOD1Ax6Xa2YERgZu/3Y23SkkX1Z0j0RkXzW3AOmeanLez6r0lF
         717A==
X-Gm-Message-State: APjAAAXM1RBHUxIv1f99ln1sk7jmRdqMbqe2riWSp55HlI3aX0mRXIA1
        vv92XhAcVMlEjBGttfwhMNjfBQ==
X-Google-Smtp-Source: APXvYqzYDLI6ZocQr+ZHvYXqPxeBPieMJMXCwRHAFBSqi0F7nqaoFBfUepWKJs6MF7wntspUgF7n9A==
X-Received: by 2002:a2e:99d2:: with SMTP id l18mr17299658ljj.27.1556520922194;
        Sun, 28 Apr 2019 23:55:22 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id k4sm3609685lja.18.2019.04.28.23.55.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:55:20 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:05:22 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 3/3] ARM: samsung: Changes for v5.2
Message-ID: <20190429060522.ijfpvz3c2bxa5xwi@localhost>
References: <20190414154805.10188-1-krzk@kernel.org>
 <20190414154805.10188-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190414154805.10188-3-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Apr 14, 2019 at 05:48:05PM +0200, Krzysztof Kozlowski wrote:
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.2
> 
> for you to fetch changes up to 7676e667c841375b41d9438b559756141aa93d0e:
> 
>   ARM: s3c64xx: Tidy up handling of regulator GPIO lookups (2019-04-14 12:53:03 +0200)
> 
> ----------------------------------------------------------------
> Samsung mach/soc changes for v5.2
> 
> 1. Cleanup in mach code.
> 2. Add necessary fixes for Suspend to RAM on Exynos5422 boards (tested
>    with Odroid XU3/XU4/HC1 family).  Finally this brings a working S2R
>    on these Odroid boards (still other drivers might have some issues
>    but mach code seems to be finished).
> 3. Require MCPM for Exynos542x boards because otherwise not all of cores
>    will come online.
> 4. GPIO regulator cleanup on S3C6410 Craig.

Merged, thanks.


-Olof
