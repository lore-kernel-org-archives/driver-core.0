Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDED83E5581
	for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105719; cv=none; b=VSIUemh3Pzak/aLuP/oJjjsaJuooNpIxqe0DOn9z4rqhgjDAtClWha4oI0NxSMmA5ni/d2tKwVwEhOOZo/y0K1Tfh7PLjOTph0yLwBv9FQY1O1TC0tE+Kevnhe2o+EjteI1+s/6TXpxRbt2BW5RbOZp3zQv3ZnIa4CD+viOZuys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105719; c=relaxed/simple;
	bh=gDXGZ+qtSgJBs1RokahbHI9JUNzui3YVteN3ANdaDwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUwY2YdSw32/eIjjdf9lkD0LQ88PG8I3PiV9dUEL/epQvuWibeXnYJozXvPX5i19VePXUCuVOElbdg6cS7DzMafAXXgyQbXG8Kr/281g0QnGh2l2sJF4emPpJ00peL5Tg01UTfN5pvIyhn5PXZ8bdU/CW0tDs5W9slvab/dCKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MEIye6Lx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MEIye6Lx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848743155bcso787592b3a.0
        for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105715; x=1784710515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=;
        b=MEIye6LxaSINkOq/81FCqMuDRNw5YzVTzi5BvJ7vzN6vR10Cibl1EY1Z85L179ov8K
         UDV6nYGuEkvjZQaPIKZH6K9ER79ogHM40YCOmJ8lBUZIYZmyYdAcAMmQlOo6n49fYFOx
         mEcevGQZ5oqxN/EU1CrbJLAlg+LZ0KahNWbUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105715; x=1784710515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=;
        b=FEQFFEe5O27jxkH7hpEmB3Q8c+YLOgzVGtbwngVh8SDV9Qkm5CV7xCMV4iMMqDjCYI
         qgNM6bh4hMVOupNy2pe5k2lX2lntLWR8MXbpvaeF4tdxAcdBZ18pWhd4jVE0uuYTBiB1
         qrtj0u37cW+ISbi7R9A8hK3JyzcwstkUHQ0/Tl87jiqv6Npx/6ETCrHlIylc+UMavsTH
         ZOtI1NC9zbmBN9naabNBjFxAOtAKwYm7YxBuM1e8kgzJvuPCxVID0Zj0qb8rGbsZCHTd
         oizdSe+q5BVrI7te4Tk7+XQuJw55Di8zhshOOlEfexW2xONHtjKdZZwoL71u5qf3TjhE
         EGrA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0ngGdBRdkOGL1R1xTnWq/swZg/6uFWUGLnoy7IeBOUZqnKO4sB9iWUYtH4SX3HrYeB0Gqk5RvfoqZsg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5NBe2UJHwd4mgt6MxM6chfrOuq464NFJiKXAgty55IMjnOtuF
	VY0I3RylQpZ5Fo8qi14XMnKEcY9jX3UV5h8C1XtjiOVOFN5Vp9ZO/uWhUXqr+OSD6A==
X-Gm-Gg: AfdE7cmiGnvT8TowL935IVbpbdPldZbWCtoUelOnd1z/ZF3SJP+HxWGEg9PtefTq03i
	8T4RzX3SwOVUmhw1p8aaiEzwnk5/AxSlIf9EyaZKlM3nFmx5nj7FAOMa7+oYGKOSjtqsRrHYKFa
	DWfLHUaYTDYcihsi9t40ss85mk4mSMFRYVwYXL2U8VS1wtM1lCwkEm54IjcBY2pCCe0wQ54afye
	Xj2w0+Ge+sSDYoVOt+GC6N5RY4UWQzNd7okSblHlhworzj/URGcSKbzzgiETbc78QMw2874+0uZ
	dgVxI6DB+ssN0e/j0jz2CpNt5tOtU8qzGElVw2NeIWiENNTRDIuyccwwoFjz2ale4tVrXQzhlxe
	DGME0CkHMMxkeKgXR+tn5vAZfbDJ5llOVg9vapo5RUzIqdETTTdT1WoyIDOPrTQ5OpjfK3ov1eM
	7MbJbmCzg8h0mPi4vQrL5APgD36bNpYxbZKFbQznj3veuAOC7IrYFNe48pw/t6+c2pkPqmQQ==
X-Received: by 2002:a05:6a00:228e:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-8488960660emr14884802b3a.23.1784105714825;
        Wed, 15 Jul 2026 01:55:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 15 Jul 2026 16:53:42 +0800
Message-ID: <20260715085348.3457359-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional (Andy)

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 83fe6a1396bc..691cad0a6dd0 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.795.g602f6c329a-goog

