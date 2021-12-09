Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAB046F4E6
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Dec 2021 21:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhLIUbe (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 9 Dec 2021 15:31:34 -0500
Received: from smtp2.axis.com ([195.60.68.18]:13580 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229850AbhLIUbe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 15:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639081681;
  x=1670617681;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=YyxODeDg+LRyAxMywwCmG089O/PaAP6cnlIZ8WqKBL8=;
  b=J8o1qyweYVNODuOn5kQ30kqm/W9xotrupeOZPrpUMnjXazpyGj55PXEv
   6RJi4g57HspvXNAxYKnZ9lVdmO1uraHSuCye6SzdZ8nbK2ngwyuZ4mOnA
   uVn/wuSAFooQQBs+/zTIczYw44KhGnz2pDbJrChnipKR7oywgtQiD8Raw
   yFJes9eXk3zyh2kx4A6NueKT1gLi9NsIVf9uYBleG8Q0rt++VSOV+TdWD
   x08tttdDBRvP3xu25BwPywJ4KvlguwvCIV8oslwccpdDgz+D6DTBXMJUe
   mS8RlgnlPh8oYz1ntQFyS/tPzUiNCv7Vd9G/8Zn/s+I7s20C0jsGPzQiJ
   A==;
Date:   Thu, 9 Dec 2021 21:27:59 +0100
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Doug Anderson <dianders@google.com>, kernel <kernel@axis.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] mmc: dw_mmc-exynos: Add support for ARTPEC-8
Message-ID: <20211209202758.GB8509@axis.com>
References: <20211209164558.13729-1-marten.lindahl@axis.com>
 <20211209164558.13729-3-marten.lindahl@axis.com>
 <cf76cbaa-5ea8-ebf1-73eb-7b99dc02f2c0@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf76cbaa-5ea8-ebf1-73eb-7b99dc02f2c0@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Dec 09, 2021 at 07:28:12PM +0100, Krzysztof Kozlowski wrote:
> On 09/12/2021 17:45, M�rten Lindahl wrote:
> > The ARTPEC-8 SoC has a DWMMC controller that is compatible with the
> > Exynos 7 version v2.70a. The main differences from Exynos 7 is that it
> > does not support HS400 and has extended data read timeout.
> > 
> > This patch adds compatibility string "axis,artpec8-dw-mshc" for
> > ARTPEC-8, and DW_MCI_TYPE_ARTPEC8 is added to the dw_mci_exynos_type.
> > 
> > Signed-off-by: M�rten Lindahl <marten.lindahl@axis.com>
> > ---
> > 
> > v2:
> >  - Change compatible string vendor prefix
> > 
> >  drivers/mmc/host/dw_mmc-exynos.c | 47 ++++++++++++++++++++++++--------
> >  1 file changed, 36 insertions(+), 11 deletions(-)
> >

Hi Krzysztof!
> 
> Here you dropped my tag as well.

I'm very sorry. I will of course add it right away.

Kind regards
M�rten
> 
> Best regards,
> Krzysztof
