Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9AE38AC78;
	Fri,  7 Aug 2026 16:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121596; cv=none; b=Eq5SH6DTMsuvpbAJBi+KB3tLZOhs1Tp27P/PTjqBjf66NEfoL8Q7UTzwDbxqZI6wz51J9htfyf2Xignn6CA6Oev/54Qt4TC/h3KM21CiJGY3BZCfvnLL2z/UbuDiQT1GK0UogORVeHmH469CInNz13cEiFyP/tDu8QnkLgSPkMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121596; c=relaxed/simple;
	bh=6+gjh4Gvuj/YByD6T4ssZ+a7Z2aa8iuzagit5WYBSzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3ThIgwJAGrRbDP1EGpKHk9FTo78+FJ6q+DNz9LXCFHnGadQ07dJ968ZKqigE0S6CN2PrrMzUE8zhMHs2sjywZvqqdHL4S8dymF3K+qQ+5sje+esAbKT6/vAXw7WKrZN4mkpxqZdubZKrSI85ebhkcXTUYohhaiZjBxzDWCVzmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yt6jcyIv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yt6jcyIv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5B71F00A3A;
	Fri,  7 Aug 2026 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786121595;
	bh=Q3IT0ymdhSoxgrdPIf0dd7pDLblnnETkkoNTCHMHVzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yt6jcyIvaiFn8+Q7fzkLmp/HDVwRwEngnIO5qYGdMVhMI62db/LqbJkxOZm/mF3NY
	 1dwkA49P18mLrPAbgj0B26AgO1lie4Wrla/OmcRs/B92aUWD9srA9YAdSHSZGqFnOx
	 pNwk+hQ5uOmF5dWipMuK2Bnh14Aw+0frXCaK/VjwYWvVSMF/2n/8iwFmjozh12S2qS
	 44C8Sb/R0F6AUioBWsnkiBVSQcEFeveLSF5dNfTJdIpu8UHacKMF83b1hnDSakcjii
	 2ptiCXzvKGI/EJH1TIs1eDfiLXI3RoSrifrKj+GuulPnOmjooOAk895Ui8FuFY7Eqz
	 PncScXU/o0D6w==
From: Danilo Krummrich <dakr@kernel.org>
To: tj@kernel.org,
	jiangshanlai@gmail.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	jhubbard@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 3/6] rust: workqueue: create workqueue subdirectory
Date: Fri,  7 Aug 2026 18:52:46 +0200
Message-ID: <20260807165252.3849875-4-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807165252.3849875-1-dakr@kernel.org>
References: <20260807165252.3849875-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

The following patch will implement a workqueue builder in a separate
file. To prepare for that, create a rust/kernel/workqueue subdirectory
and move the existing file.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS                                    | 1 +
 rust/kernel/{workqueue.rs => workqueue/mod.rs} | 0
 2 files changed, 1 insertion(+)
 rename rust/kernel/{workqueue.rs => workqueue/mod.rs} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index f672858996f0..9cee804d840d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29155,6 +29155,7 @@ F:	Documentation/core-api/workqueue.rst
 F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
+F:	rust/kernel/workqueue/
 
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue/mod.rs
similarity index 100%
rename from rust/kernel/workqueue.rs
rename to rust/kernel/workqueue/mod.rs
-- 
2.55.0

