Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECE53B47C1;
	Fri,  7 Aug 2026 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088873; cv=none; b=BdlOlmtmB34a9kGXlfxBOYy8tt46oKABkQIssWPykw/cX0cI3rxEOBNAWmkjFWA7K4ztR1FC/fn/sYlN3NY1iRx1i6WQVC7Iq3TFsOMJGk7AsFJcB4L18knPwFE9mrkX2/GqX3rlrih8DhLWnn97V6q3DK8A43hTQ+JrQc3EkPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088873; c=relaxed/simple;
	bh=iqIKYNlmCv0hF3AVgPGXQqLOWJcFVEyfZDjmiiwFG6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ElHmR+7UQ42YVUIQb40jNrx5/vQZYo1DB7fyNyU5lHsLaGDF/gTRlf237N/nwTF5lXW7/3cTpQoIEbRhdrHJqbwLTN4Xjh2HMYs/TBB4EJgTV8tr9/ffuMELZjcV8The6npOrZmEyq7hURzUukVUbyXGPbBuIcBrM4QssGufpJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhXJmGFR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhXJmGFR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DAB1F000E9;
	Fri,  7 Aug 2026 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786088871;
	bh=dpUOm8WmgFWx7EiOz6JPn3kiHIpyo9Na2Sj45FWRUPU=;
	h=From:To:Cc:Subject:Date;
	b=WhXJmGFRIWdClSkHdJv6rpV/ynGUh6oPLDCtAxK2j2+5G2s07mPIdR/CLA47LnBMy
	 IunNkR+DTL5QNgIUNl8KYgKAJA7ShgKrvQdmYvh9lEVJfKEYtJ6P0Xdf0UoZy9lDXd
	 Arp9quEtgSltFD7Rf3ngixMQ61y8wpEY9hFpLHHhC5WQmdDnXmJ4yBCm0a/SPMsm9q
	 JbUZgXzb/YbQuM2yaOkWKbtSV1qYHbZ+Kiy2Ytb1zcyOG41ycxpeOttGak1HtntsZw
	 bS1eulgppaPIdUwqnP/groYil6zYOwMy4dcX0zt4fPO/UZ1XVQr+c7g93pekxG6pB6
	 1w+RyMHjeYUVw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: linux-next@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] rust: serdev: replace `__pinned_init` with `raw_try_init`
Date: Fri,  7 Aug 2026 09:47:29 +0200
Message-ID: <20260807074729.108159-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit

  ea7da3116015 ("rust: treewide: replace `__pinned_init` with `raw_[try_]init`")

from the pin-init tree replaced the method before removing it, but commit

  99f59aa82341 ("rust: add basic serial device bus abstractions")

from the driver-core tree added a new use.

Thus replace that one as well.

Link: https://lore.kernel.org/rust-for-linux/5ce12a15-3f1e-4279-9b1a-57d6b2faf7c9@sirena.org.uk/
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/serdev.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index c0cd24481ee3..a4927452016e 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -197,7 +197,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             // SAFETY:
             // - `driver.as_mut_ptr()` is a valid pointer to uninitialized data.
             // - `private_data.driver` is pinned.
-            let result = unsafe { data.__pinned_init(driver.as_mut_ptr()) };
+            let result = unsafe { pin_init::raw_try_init(driver.as_mut_ptr(), data) };

             *active = result.is_ok();


base-commit: 1fc711bb8253ffd6fdfcf262bbccac53e8e9ff67
--
2.55.0
