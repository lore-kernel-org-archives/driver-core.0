Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC50E44CAE6
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545572; cv=none; b=oQMfC/mWpEvZ9k3QvN0ki80KqtdK2GVZp724pKz2bwKiU5zLC7psPf+C4sUJpnK28GlFY9Mv/ZDuaCGnV6WjtWzKYCQc/6DlY/amTiH8jWtYerS+DAE6ph+kpIkZRCElRdcYOZwIgzQKMeezgs4hrhaYJ/cNt+zEcS31LyNs/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545572; c=relaxed/simple;
	bh=eyI1vaHvczB69tPN00V8OLfMpbO9IL68H/HlfpvrLfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAk+EhEsRxjOvRR1JDsEjnd4SnSrsnqrwMNyG/bH+I9UtniHXGFlpeKC82McYj7q+59HlT5UuOtkx+gEt6i6viieZUpCzpoi0BSuVu7OGMc7xbf8PY4jVpFnsdOldKq6gWpk5a9jNiChDQSx3FBvIHEbrJWm8kO5odBWgs9k3U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R4B26rpb; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R4B26rpb"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so504071a91.2
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545561; x=1790150361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=;
        b=R4B26rpbpOGS0B7iqSkPcdWl21lIHQ9NoX8lJpmCpmqHlswOXHb43OfPBHdrJDB8H7
         AqQv53c+gKJ1jSJXf3ZbzDCO2JC7BQ1/BKO11j9n0qBqNhXhp+2PmBVFUabWbs056Kb6
         7d2NjQYs5ryE8w+q5qLvZQhqb/0p/EYNwoVgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545561; x=1790150361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ud8Ab8x/DbJP2ljWLphVYfSDOg1pJvQBgrltchLDCh0=;
        b=HLWKtYofgFfCu0p8eAQ0xMYCr+PGo1NHXHCplDTmzVEQZtq7Xzn00n9W44e+Oj43En
         ra+5oNexSYYYvfDkIQG19Agb9BO5ykUpCCJnuzxXLmgQryXSRwg8Jmxqd/SeT4yBLf0s
         el2u+v8G4JaYbTgBbKNlbhM9PMh7I+f0+E99XwnsM8EalDjZh1IjZKeZUoQhl6rRLuTL
         92LBoC1aoRJTf4XSsbPcrFKopbOOmiqvi89vPzxs7YgpQ9QS81L1+Z1TruxDIpJto/Aw
         Eayu32wLCVpn+2NYljrtRvAupZmDIU6pWUE5+2Ooe/DwY6uVOJxLQ3pbRFHbHK+GVQZ8
         v89A==
X-Forwarded-Encrypted: i=1; AKwUvBybHKZCQIHVReuDwfufNigzRtZs8DpE9zPMOYslPkf/McLOKgYK76bLWNW2YZFRog2dijed0Ip6Urkjow==@lists.linux.dev
X-Gm-Message-State: AFuF++nsBrHDWnmV+rUJFgeQA1s7oc+Df4IWFqAKj/61SivtNDJKqzKN
	XUPVSaWU5Y4jJxlkYLEzTzJtOO3hdRGtUSLDvMWdBiEfbSNSY6cEgrlGEfNJmmQG1Q==
X-Gm-Gg: AYBFou2rlvjZ+/tCyjdaFKXOOvFk4co5prTIpTGdY4pnApJG/4eaFaiqEigr5xo12do
	uMkMv+m63BlTsHGmIVHHbf/NLQ1DD155R9c4rF+kwZVYxRJyHqfl2bBIDDTAbXCcfnXXHvfv0F+
	ciJV255I6iQUbTWFg6GbxEO43YF+M6GLKrRPKDhry4JXOLqs8g1J6gOx/qZIABs2Jux6c+ixjBO
	Zlh+ypAeGebekzEQuBdQHMbHRgfMmaqNSdLKZEB3RxDs0WUqm0pmWkoQ8H6M3QMHBeQVTZ/lMbO
	kC+hoQEAjYf1xJ06FWnVrj3CtI7IlRHAtBz+fJYlJFomwNdJ2oO/QT2IVmCuVm4ZqiQzUWNniM9
	nlpIJ3p+9E+F+tH5S2nT122O5CHVgrXyL47/1wdfHWF3QCkT76/v+nR9+15pMVEdNa5j0gWTngG
	y2WFAnuY3AfLAo77gcA+HxiMu4UyCjrH0Jt0oaFkpvLESg8rM+yF/7M5er7oxZs4eQJjhn1cZej
	SJ+9iDHgiQFUWxzEPK59CVpni+Et5eOmEwsEu7asZkKfi9LsZvgSBMT0Q==
X-Received: by 2002:a17:90b:3e85:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39e1e55f7ffmr3982483a91.24.1789545561399;
        Wed, 16 Sep 2026 00:59:21 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:20 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 11/15] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 16 Sep 2026 15:57:37 +0800
Message-ID: <20260916075745.3549953-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 322c307ce6c6..350a4c8831f7 100644
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
2.55.0.1032.g73a4cd73de-goog

