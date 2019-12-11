Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF3B11BB16
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Dec 2019 19:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbfLKSJo (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 11 Dec 2019 13:09:44 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42477 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731046AbfLKSJn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 13:09:43 -0500
Received: by mail-ed1-f67.google.com with SMTP id e10so20184899edv.9;
        Wed, 11 Dec 2019 10:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ILp2Lf5P15MYbkV7ek1FJDOE0NtqRWE6/NU2Ipca/04=;
        b=uVTl6HIOGVQ8MZQ1GLPSbu4MARErsCM7KoITJ7LRkp50tXD2e4hHj7k5u++WuKNtJo
         FEhlYyN3G1MCCpK8W+p3zZh4tqQ3ET+fkWzoVoEtk8fXARmrLiGDHt7QSc59utV/KILE
         TrlAFmW/XrRUWwn6jzfwRc6ELr/grQ5OKtB1EvqN6T3CEQhuudXW8McMbZ0Qk7EjuczJ
         ejeoW9gPB8kB5xDL+pux0b61tAymTktJLyGXfO8ztEM75iciPV5LWTnYDxYaBl9YSBn1
         j/pjcPk4Ds/k+ttKV4SQtHdF6zhB56Ir2jkzQGvcveEtdOGfxWSzSBQ+ZxLO074sepU4
         xAkw==
X-Gm-Message-State: APjAAAUi8ZDtxRbo8ezFcDnJzRxzUCvgpmo30wAnU83gqLvMqtIXR93C
        LwttezGz4MDyfrAXasDthWM=
X-Google-Smtp-Source: APXvYqxbSc/1pMrFp7jj1xrbhKuiKUxJi3QB/0yA0bRIjtn2bO+hRfiUZUax+luAzlnxU6ZmzIqDVQ==
X-Received: by 2002:a05:6402:1350:: with SMTP id y16mr4911656edw.176.1576087781772;
        Wed, 11 Dec 2019 10:09:41 -0800 (PST)
Received: from kozik-lap ([194.230.155.234])
        by smtp.googlemail.com with ESMTPSA id o30sm64065edc.61.2019.12.11.10.09.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 10:09:41 -0800 (PST)
Date:   Wed, 11 Dec 2019 19:09:38 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Lukasz Luba <l.luba@partner.samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: exynos_defconfig: Bring back explicitly wanted
 options
Message-ID: <20191211180938.GA6690@kozik-lap>
References: <CGME20191205200017epcas5p446f5f29988e34d939601287a7517fdfe@epcas5p4.samsung.com>
 <20191205200006.5164-1-krzk@kernel.org>
 <08916577-3218-ecd4-a8e2-ab4fbff5332b@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08916577-3218-ecd4-a8e2-ab4fbff5332b@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Dec 06, 2019 at 09:01:07AM +0100, Marek Szyprowski wrote:
> Hi Krzyszotof,
> 
> On 05.12.2019 21:00, Krzysztof Kozlowski wrote:
> > Few options KALLSYMS_ALL, SCSI, PM_DEVFREQ and mutex/spinlock debugging
> > were removed with savedefconfig because they were selected by other
> > options.  However these are user-visible options and they might not be
> > selected in the future.  Exactly this happened with commit 0e4a459f56c3
> > ("tracing: Remove unnecessary DEBUG_FS dependency") removing the
> > dependency between DEBUG_FS and TRACING.
> >
> > To avoid losing these options in the future, explicitly mention them in
> > defconfig.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> I will not mind adding:
> 

Applied.

Best regards,
Krzysztof

