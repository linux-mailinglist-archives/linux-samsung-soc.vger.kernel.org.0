Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63984134DE2
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  8 Jan 2020 21:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgAHUtt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 8 Jan 2020 15:49:49 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41743 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgAHUtt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Jan 2020 15:49:49 -0500
Received: by mail-oi1-f195.google.com with SMTP id i1so3908675oie.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jan 2020 12:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y2blFDS/4xPh5DF4rW8+xU8LHc7BSZTKgnRIfuXGUCs=;
        b=j4KmsgZOJZ/YSNv9CBlB72AZhLmPHNMo5NZ6D1RwiQ3ftWV7aV67Kov1i8LcgUhc4L
         5/+kil6NOTA36RuLJvzLnMpaOVmMDmV3PZbHZEUXiItYq630i1IGH9IsdFCVFgeQ32A5
         +sgQCq1HNQY64wBLwoQ1Am9hPeddoMFyLBP01aaWeZ+GVdubZtMd9SFotC1xvvectzqD
         6HzO6XjwKBnxtm5mDs2o7UeiNn876kMUBjyglQ5qeK8wIEJsZFslCGZdhPyU7uUED3vL
         4B64VgvMWYD3zo+0muHAI4ayDASU0V4u3pbleCxWdV8Lg8UJT9O+oGzMpBZifSQ0L83Z
         UXOQ==
X-Gm-Message-State: APjAAAU+77lfUDHNrWOjgYVqSx0MwCSOfd3zoIjkxZd/9bq2/FLLslbM
        4l9JWCGYh80QmEczc9JeZ4HkE1E=
X-Google-Smtp-Source: APXvYqzFbzx9GrmgaARCFfQiMUwuXl8kTNxLU516t82pISlYTBu+SlrvP4NiPa8v7l0HraFCWPQd8g==
X-Received: by 2002:aca:458:: with SMTP id 85mr451640oie.56.1578516589248;
        Wed, 08 Jan 2020 12:49:49 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e17sm1507076otq.58.2020.01.08.12.49.48
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:49:49 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:49:48 -0600
Date:   Wed, 8 Jan 2020 14:49:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org,
        hminas@synopsys.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        amelie.delaunay@st.com,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v3] dt-bindings: usb: Convert DWC2 bindings to json-schema
Message-ID: <20200108204948.GA9782@bogus>
References: <20200107091630.12796-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107091630.12796-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 7 Jan 2020 10:16:30 +0100, Benjamin Gaignard wrote:
> Convert DWC2 bindings to DT schema format using json-schema.
> DWC2 is widely use but a couple of compatibles and properties
> (vusb_d-supply,vusb_a-supply) were missing in dwc2.txt, the
> patch add them.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> CC: Minas Harutyunyan <hminas@synopsys.com>
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> 
> changes in version 3:
> - put Rob Herring as maintainer
> - change the example to use one of the listed compatible
> 
> changes in version 2:
> - put Minas Harutyunyan <hminas@synopsys.com> as maintainer
> - remove type and description from phy property
> - remove description from compatible items
> - simplify samsung,s3c6400-hsotg compatible handling
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt  |  64 ----------
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 151 ++++++++++++++++++++++++
>  2 files changed, 151 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc2.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/dwc2.yaml
> 

Applied, thanks.

Rob
