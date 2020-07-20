Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BC4226285
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Jul 2020 16:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgGTOuA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Jul 2020 10:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGTOt7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 10:49:59 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B10FC0619D2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2020 07:49:59 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id 88so7876368wrh.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2020 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5sLF/sPtlwCH+sd1O451ya1iBl+DQ2/XqJaaGU21mgI=;
        b=YQRnFSl35dnimP+3Mm9aYrKDK3uJXYMZ4Ak+ue/Nqc7tr1kInNtXTk0DYha0Yh+Yek
         h+dKxcCsLDywGd5wg0uWuxPBjtjpM1BZOz/Ehz9MDIQFr9lDfcS1cYs3ohH5b2QTY+Kz
         lLStffj6cr7AAQ42WG/icBHZeGX/fNgLqV9iJdUpC+fkmL1fnYHrF4QNaRxYz4ImwZgg
         qx3Z2raaSfO7XLym7u7Xric5roAQH3veO1/eLkhTBDM/oo/YJ62mJ+CUA38aJ6yGCDMQ
         s6nW3mrRdNNmo7BFw1chkkpZ/yg0/tQgYpjcpfzPopeh8zn+J7PCf3pcwnnOLStuf1mi
         I23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5sLF/sPtlwCH+sd1O451ya1iBl+DQ2/XqJaaGU21mgI=;
        b=ENWpP8roP5tJ5n38nXyXGkTNKSWmLvLYGuaE8OWuPJpaOl2YxDc9sEg1lz6X96UEQT
         zelfhEWjHO06RcCEMeR7fshMXM9YObfhmq51fy3nl+X2skEHEpHYcPNiw+8PXDSBMHbq
         LjUlCBwry0itDdGM73LvY32pa+HWDcr24oI1SGuS7gFR0D1zZr4hnLWoJ/2Vsk93HDFU
         k0AQBqNaEBf0gUV3Vk+ZfnsHI4GT2ZunXco+kjkS5TMklEc9+PAYBrsI/iamldzxJd7g
         IRlcOPTp28gTF3rtiy9NVpbDp/a8YMFuQkTSATCBQiWFfraqQJ4G0qNMuAOlTO/AFO3S
         BUOw==
X-Gm-Message-State: AOAM5308t3EIfiEGTcCO2E43FKWYhssuAeY05aPfXiDtN2x5XVwPLALX
        fhnAJEFZbDTjjk9pgIm302oa3w==
X-Google-Smtp-Source: ABdhPJx0eSsScLmjCgILcg+D8bH0FTIV+nC0ejd3OMEzJ1s6c+El1M6A71SDWbhwZcOtRtQs59Thiw==
X-Received: by 2002:adf:dcc9:: with SMTP id x9mr8738276wrm.153.1595256597966;
        Mon, 20 Jul 2020 07:49:57 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id b139sm226738wmd.19.2020.07.20.07.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 07:49:57 -0700 (PDT)
Date:   Mon, 20 Jul 2020 15:49:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 06/25] pinctrl: samsung: pinctrl-samsung: Demote obvious
 misuse of kerneldoc to standard comment blocks
Message-ID: <20200720144955.GD3368211@dell>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-7-lee.jones@linaro.org>
 <20200720142714.GA6747@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200720142714.GA6747@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 20 Jul 2020, Krzysztof Kozlowski wrote:

> On Mon, Jul 13, 2020 at 03:49:11PM +0100, Lee Jones wrote:
> > No attempt has been made to document either of the demoted functions here.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/pinctrl/samsung/pinctrl-samsung.c:1149: warning: Function parameter or member 'dev' not described in 'samsung_pinctrl_suspend'
> >  drivers/pinctrl/samsung/pinctrl-samsung.c:1199: warning: Function parameter or member 'dev' not described in 'samsung_pinctrl_resume'
> > 
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: Thomas Abraham <thomas.ab@samsung.com>
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
> 
> Thanks, applied.

Same as the others.  Already in -next.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
