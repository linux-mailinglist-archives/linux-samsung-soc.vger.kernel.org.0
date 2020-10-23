Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994B4296EB0
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 23 Oct 2020 14:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463693AbgJWMXR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 23 Oct 2020 08:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463707AbgJWMXR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 08:23:17 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E99C0613D2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:16 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n18so1579777wrs.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2020 05:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rl2aV6v4BUOFD3sWM4dGPxjWFUFBHT1H6eKln2146qM=;
        b=MXuVxECtJ78bOiKGDfTFAHp+CJhdgNky1rItm2A5X7tJL5vSSg4lbAVohhini2H0yd
         xh374IeyDf7uaUzvTG9zdianxpiWqa1UVuaj2eiOwSQsJ2XHInhGqMSD1spurc8v+95N
         ChQ4jEq74dxOuKfApkooMZETrU8kZ+CcHZQ1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rl2aV6v4BUOFD3sWM4dGPxjWFUFBHT1H6eKln2146qM=;
        b=GWfZ7m1G/By3Oe/gOUsl6f2M28rfaDu8thKmvpE6wMkV4HfRxCqYw32j0A04ISPzuF
         w6Xu3zDNDo5ADtuL7KrDWVeqPCccU5syZ7H/tpoUEgmnQe7bj8VcHzAN7Q8loQyeYpGu
         Ui2ZIF3Tj5ETOVzz8OS4U7HtXp8F7RetCkbrsOBAS8FYQCNftrdmAeDyiwR0yLfaBuhS
         5Q/Zhs+IxVyhuU91DjPaLCMeze9axyg56O9/zNzSBIfHSWh+FI4Nxu6UMWQYta3DuV9F
         3AwEC8eNqWPulOHJwIUQKjd3PGryRbjiQtuPTAN3jPVd22MI4s7LV7kcLRoPBg1KuGyb
         Vw2A==
X-Gm-Message-State: AOAM5330AeKOdDs15wreNUJuTzWxkg3CMxnNg0QhRzSjetaK9JkQVOAd
        10HdKY51DA9dyLb/c4UM8vBzHA==
X-Google-Smtp-Source: ABdhPJwV5FzPPp/4Ge7bj9kllxBQ6Gec4MZEynrcnFexeILKj2jkWpYJEMkJr7ScFwkgM+ZpKL2Tqg==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr2353056wrv.266.1603455795408;
        Fri, 23 Oct 2020 05:23:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:23:14 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Subject: [PATCH 44/65] PCI: Revoke mappings like devmem
Date:   Fri, 23 Oct 2020 14:21:55 +0200
Message-Id: <20201023122216.2373294-44-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
the region") /dev/kmem zaps ptes when the kernel requests exclusive
acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
the default for all driver uses.

Except there's two more ways to access PCI BARs: sysfs and proc mmap
support. Let's plug that hole.

For revoke_devmem() to work we need to link our vma into the same
address_space, with consistent vma->vm_pgoff. ->pgoff is already
adjusted, because that's how (io_)remap_pfn_range works, but for the
mapping we need to adjust vma->vm_file->f_mapping. The cleanest way is
to adjust this at at ->open time:

- for sysfs this is easy, now that binary attributes support this. We
  just set bin_attr->mapping when mmap is supported
- for procfs it's a bit more tricky, since procfs pci access has only
  one file per device, and access to a specific resources first needs
  to be set up with some ioctl calls. But mmap is only supported for
  the same resources as sysfs exposes with mmap support, and otherwise
  rejected, so we can set the mapping unconditionally at open time
  without harm.

A special consideration is for arch_can_pci_mmap_io() - we need to
make sure that the ->f_mapping doesn't alias between ioport and iomem
space. There's only 2 ways in-tree to support mmap of ioports: generic
pci mmap (ARCH_GENERIC_PCI_MMAP_RESOURCE), and sparc as the single
architecture hand-rolling. Both approach support ioport mmap through a
special pfn range and not through magic pte attributes. Aliasing is
therefore not a problem.

The only difference in access checks left is that sysfs PCI mmap does
not check for CAP_RAWIO. I'm not really sure whether that should be
added or not.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v2:
- Totally new approach: Adjust filp->f_mapping at open time. Note that
  this now works on all architectures, not just those support
  ARCH_GENERIC_PCI_MMAP_RESOURCE
---
 drivers/pci/pci-sysfs.c | 4 ++++
 drivers/pci/proc.c      | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 6d78df981d41..cee38fcb4a86 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -928,6 +928,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 	b->legacy_io->read = pci_read_legacy_io;
 	b->legacy_io->write = pci_write_legacy_io;
 	b->legacy_io->mmap = pci_mmap_legacy_io;
+	b->legacy_io->mapping = iomem_get_mapping();
 	pci_adjust_legacy_attr(b, pci_mmap_io);
 	error = device_create_bin_file(&b->dev, b->legacy_io);
 	if (error)
@@ -940,6 +941,7 @@ void pci_create_legacy_files(struct pci_bus *b)
 	b->legacy_mem->size = 1024*1024;
 	b->legacy_mem->attr.mode = 0600;
 	b->legacy_mem->mmap = pci_mmap_legacy_mem;
+	b->legacy_io->mapping = iomem_get_mapping();
 	pci_adjust_legacy_attr(b, pci_mmap_mem);
 	error = device_create_bin_file(&b->dev, b->legacy_mem);
 	if (error)
@@ -1155,6 +1157,8 @@ static int pci_create_attr(struct pci_dev *pdev, int num, int write_combine)
 			res_attr->mmap = pci_mmap_resource_uc;
 		}
 	}
+	if (res_attr->mmap)
+		res_attr->mapping = iomem_get_mapping();
 	res_attr->attr.name = res_attr_name;
 	res_attr->attr.mode = 0600;
 	res_attr->size = pci_resource_len(pdev, num);
diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index 3a2f90beb4cb..9bab07302bbf 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -298,6 +298,7 @@ static int proc_bus_pci_open(struct inode *inode, struct file *file)
 	fpriv->write_combine = 0;
 
 	file->private_data = fpriv;
+	file->f_mapping = iomem_get_mapping();
 
 	return 0;
 }
-- 
2.28.0

