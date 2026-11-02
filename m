Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577846;
	b=RDPiHhEeTHz3ftH21KndLBKU/TfVAOhP+Qf6bACqJcak7t8icB7tYccR1k10YL0goAGJ
	 nuqWVQwzryjoYNlez2YNGYgw8qj4OlbhTC34p/1MwOkGZE+dmf/NWxE+NHSldi259k9af
	 fWa7+exmU7i6YAoyxQxgQ0uWHCKzeBfWZOwZHJhZwxLX2gynftf/3sefaO8l/osP29ZWh
	 mVIy4bMans9CC0TsP+lvGEZQzS7MVo/VL6oi0nJJPqqc5CTXv2VfrXtXp0R7oMD5FrGIn
	 4HJbI+lDqDlEBvcTz8aBTiVxwEc+O3a7cwZ4eoe8m73J1n+NHDkNqzUjOs+nPkQ+IFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577846;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=U8BXq1ZgzTnuzcu2ZZ0IDWouTRhXxYtku8B8fJXMvuU=;
	b=osxRmL3DgDvR86UeIBo4x6ZLSZBSg1ZMq2tGtUIyxekC3OmLiLsW3Ict8GCbu7M7eCPH
	 AJjV1zuwoedrpRPKh+7Ooroj61XiAMNQJxiACHyS7mA71oFao+ic5KfnkO+WG4ka5Ztzy
	 OdV9lLyjnZ9IboHVL73Z4FDXITXisvpwGVnJBotYhBeWr7ukbWGosGsYl2JEUISg5VNlQ
	 SF4RzL7epAt7TpzKSnrZxJRrzbdHWvG1UnXYSwclBLJQGWRd9PtTLL+7X7Xx9EtpmJ2mf
	 ib4Bd0lvJGtsty8D0M86Xiaf/3Dd6J9qjNS/dcc21rQYQpXcVvJONxm1oYZwwiTzvhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omh61oRF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38AE606A324;
	Mon,  2 Nov 2026 00:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omh61oRF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4381F000C1;
	Mon,  2 Nov 2026 00:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793577845;
	bh=U8BXq1ZgzTnuzcu2ZZ0IDWouTRhXxYtku8B8fJXMvuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=omh61oRFlZIGOwkbl+UdKQAd8k3xbCBUSwE9FnToikZ5RJ2W3Es8DepZbYqtR/H9p
	 cD93Zgz8FwlRbGuEGPnrzcKUx9/M4I4hO1ATCLMdFJK1aH+Mp5FN59Gw6hk9v3OaRk
	 Z+B4Z/CND2SxHjaGrnPDvc2RUnCUkbk1sAn+VSRLwtNZzL13VEVLK925XDNtLbN0Kz
	 L5nOnwiAz99mmnk8mXGcEu435mNCEcjxTvT3ytj9mH1nFv08MG4IIc9CAED1vjNnrp
	 J4sdcNl/bCJgotSb3nl5W1lWxISp0LeCWWsKE06l0f6kRWy2hTF/E7SH5QASQZFQZD
	 LyH/Pk8n8tiUA==
From: Danilo Krummrich <dakr@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] debugfs: clarify return values when disabled
Date: Mon,  2 Nov 2026 01:03:59 +0100
Message-ID: <20261102000359.2510155-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027053754.1339833-1-rdunlap@infradead.org>
References: <20261027053754.1339833-1-rdunlap@infradead.org>
X-Patch-Reply: applied
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 26 Oct 2026 22:37:54 -0700, Randy Dunlap wrote:
> [PATCH v2] debugfs: clarify return values when disabled

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] debugfs: clarify return values when disabled
      commit: abad490d6849

      [ Use ERR_PTR() consistently in the debugfs_create_file() comment.
        - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
